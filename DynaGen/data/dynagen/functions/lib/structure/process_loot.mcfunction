#sets the seed of 1 loot container per iteration

#read the structure offsets for the list item and convert them to world offsets
execute if score #direction DGvar matches 0 run function dynagen:lib/structure/rotated_offset_0
execute if score #direction DGvar matches 1073741824 run function dynagen:lib/structure/rotated_offset_90
execute if score #direction DGvar matches -2147483648 run function dynagen:lib/structure/rotated_offset_180
execute if score #direction DGvar matches -1073741824 run function dynagen:lib/structure/rotated_offset_-90
execute store result score #yOffset DGvar run data get storage dynagen: IndexList[0].Offset.y

#move the entity to the location
execute store result storage dynagen: PosTemp[0] double 1 run scoreboard players operation #xOffset DGvar += #xCoord DGvar
execute store result storage dynagen: PosTemp[1] double 1 run scoreboard players operation #yOffset DGvar += #yCoord DGvar
execute store result storage dynagen: PosTemp[2] double 1 run scoreboard players operation #zOffset DGvar += #zCoord DGvar
data modify entity @s Pos set from storage dynagen: PosTemp

#set the container's loot seed
function dynagen:lib/lcg_next
execute positioned as @s store result block ~ ~ ~ LootTableSeed long 1 run scoreboard players get #lcgSeed DGvar

#decrement and call next iteration if applicable
data remove storage dynagen: IndexList[0]
scoreboard players remove #index DGvar 1
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/process_loot