#builds a list of junction world coords and pools by one item per iteration
#the actual placing of the structure blocks must be done by the module creator as there are too many ways to combine them
# thus it would cause really poor efficiency, doing so is covered in the load_structure_complex template

#read the offsets for the list item and convert them to actual coordinates
execute if score #direction DGvar matches 0 run function dynagen:lib/structure/rotated_offset_0
execute if score #direction DGvar matches 1073741824 run function dynagen:lib/structure/rotated_offset_90
execute if score #direction DGvar matches -2147483648 run function dynagen:lib/structure/rotated_offset_180
execute if score #direction DGvar matches -1073741824 run function dynagen:lib/structure/rotated_offset_-90
execute store result score #yOffset DGvar run data get storage dynagen: IndexList[0].Offset.y
scoreboard players operation #xOffset DGvar += #xCoord DGvar
scoreboard players operation #yOffset DGvar += #yCoord DGvar
scoreboard players operation #zOffset DGvar += #zCoord DGvar

#create the Pos entry
data modify storage dynagen: JunctionList append value {Pos:[0d,0d,0d]}
execute store result storage dynagen: JunctionList[-1].Pos[0] double 1 run scoreboard players get #xOffset DGvar
execute store result storage dynagen: JunctionList[-1].Pos[1] double 1 run scoreboard players get #yOffset DGvar
execute store result storage dynagen: JunctionList[-1].Pos[2] double 1 run scoreboard players get #zOffset DGvar

#read the relative rotation and turn it into an absolute rotation entry that matches the real rotation of the junction
execute store result score #rotation DGvar run data get storage dynagen: IndexList[0].Rotation
scoreboard players operation #rotation DGvar += #direction DGvar
execute store result storage dynagen: JunctionList[-1].Rotation int 1 run scoreboard players get #rotation DGvar

#copy the pool entry, needs to be in a subtag or else can't match using "execute if data"
data modify storage dynagen: JunctionList[-1].Pool.Name set from storage dynagen: IndexList[0].Pool

#decrement and call next iteration if applicable
data remove storage dynagen: IndexList[0]
scoreboard players remove #index DGvar 1
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/create_junction_list