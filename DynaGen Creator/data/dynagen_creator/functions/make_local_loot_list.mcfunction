#get the current entry's coords as scores
# subtract the coords of the current junction to get the relative offset to it
# and add it to the local loot list for this junction
data modify storage dynagen_creator: ItemData.LootList append value {}
execute store result score #offset DGCvar run data get storage dynagen_creator: MLLcopy[0][0]
execute store result storage dynagen_creator: ItemData.LootList[-1].Offset.x byte 1 run scoreboard players operation #offset DGCvar -= #xCoord DGCvar
execute store result score #offset DGCvar run data get storage dynagen_creator: MLLcopy[0][1]
execute store result storage dynagen_creator: ItemData.LootList[-1].Offset.y byte 1 run scoreboard players operation #offset DGCvar -= #yCoord DGCvar
execute store result score #offset DGCvar run data get storage dynagen_creator: MLLcopy[0][2]
execute store result storage dynagen_creator: ItemData.LootList[-1].Offset.z byte 1 run scoreboard players operation #offset DGCvar -= #zCoord DGCvar

#remove the used entry and decrement, then call the next iteration of the loop
scoreboard players remove #listIndex DGCvar 1
data remove storage dynagen_creator: MLLcopy[0]
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_loot_list