#get the current entry's coords as scores
execute store result score #xOffset DGCcvar run data get storage dynagen_creator: MLLcopy[0][0]
execute store result score #yOffset DGCcvar run data get storage dynagen_creator: MLLcopy[0][1]
execute store result score #zOffset DGCcvar run data get storage dynagen_creator: MLLcopy[0][2]

#subtract the coords of the current junction to get the relative offset to it
scoreboard players operation #xOffset DGCvar -= #xCoord DGCvar
scoreboard players operation #yOffset DGCvar -= #yCoord DGCvar
scoreboard players operation #zOffset DGCvar -= #zCoord DGCvar

#add it to the local loot list for this junction
data modify storage dynagen_creator: ItemData.LootList append value {Pos:[0b,0b,0b]}
execute store result storage dynagen_creator: ItemData.LootList[-1].Pos[0] byte 1 run scoreboard players get #xOffset DGCvar
execute store result storage dynagen_creator: ItemData.LootList[-1].Pos[1] byte 1 run scoreboard players get #yOffset DGCvar
execute store result storage dynagen_creator: ItemData.LootList[-1].Pos[2] byte 1 run scoreboard players get #zOffset DGCvar

#remove the used entry and decrement, then call the next iteration of the loop
scoreboard players remove #listIndex DGCvar 1
data remove storage dynagen_creator: MLLcopy[0]
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_loot_list