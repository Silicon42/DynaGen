#get the current entry's coords as scores
#subtract the coords of the current junction to get the relative offset to it
#add it to the local junction list for this junction if it is not itself
execute store result score #offset DGCvar run data get storage dynagen_creator: MJLcopy[0].Pos[0]
execute store result storage dynagen_creator: MJLcopy[0].Offset.x byte 1 run scoreboard players operation #offset DGCvar -= #xCoord DGCvar
execute store result score #offset DGCvar run data get storage dynagen_creator: MJLcopy[0].Pos[1]
execute store result storage dynagen_creator: MJLcopy[0].Offset.y byte 1 run scoreboard players operation #offset DGCvar -= #yCoord DGCvar
execute store result score #offset DGCvar run data get storage dynagen_creator: MJLcopy[0].Pos[2]
execute store result storage dynagen_creator: MJLcopy[0].Offset.z byte 1 run scoreboard players operation #offset DGCvar -= #zCoord DGCvar
data remove storage dynagen_creator: MJLcopy[0].Pos
execute unless data storage dynagen_creator: MJLcopy[0].Offset{x:0b,y:0b,z:0b} run data modify storage dynagen_creator: ItemData.JunctionList append from storage dynagen_creator: MJLcopy[0]

#remove the used entry and decrement, then call the next iteration of the loop
scoreboard players remove #listIndex DGCvar 1
data remove storage dynagen_creator: MJLcopy[0]
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_junction_list