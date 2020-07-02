#get the current entry's coords as scores
execute store result score #xOffset DGCcvar run data get storage dynagen_creator: MJLcopy[0].Pos[0]
execute store result score #yOffset DGCcvar run data get storage dynagen_creator: MJLcopy[0].Pos[1]
execute store result score #zOffset DGCcvar run data get storage dynagen_creator: MJLcopy[0].Pos[2]

#subtract the coords of the current junction to get the relative offset to it
scoreboard players operation #xOffset DGCvar -= #xCoord DGCvar
scoreboard players operation #yOffset DGCvar -= #yCoord DGCvar
scoreboard players operation #zOffset DGCvar -= #zCoord DGCvar

#add it to the local junction list for this junction if it is not itself
data modify storage dynagen_creator: JunctionTemp.Pool set from storage dynagen_creator: MJLcopy[0].Pool
data modify storage dynagen_creator: JunctionTemp.Rotation set from storage dynagen_creator: MJLcopy[0].Rotation
execute store result storage dynagen_creator: JunctionTemp.Pos[0] byte 1 run scoreboard players get #xOffset DGCvar
execute store result storage dynagen_creator: JunctionTemp.Pos[1] byte 1 run scoreboard players get #yOffset DGCvar
execute store result storage dynagen_creator: JunctionTemp.Pos[2] byte 1 run scoreboard players get #zOffset DGCvar
execute unless data storage dynagen_creator: JunctionTemp{Pos:[0b,0b,0b]} run data modify storage dynagen_creator: ItemData.JunctionList append from storage dynagen_creator: JunctionTemp

#remove the used entry and decrement, then call the next iteration of the loop
scoreboard players remove #listIndex DGCvar 1
data remove storage dynagen_creator: MJLcopy[0]
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_junction_list