#decrement the index and move marker to next slice
scoreboard players remove #zIndex DGCvar 1
tp @s ~ ~ ~1

#reset the y position and index
scoreboard players operation #yIndex DGCvar = #sizeY DGCvar
data modify entity @s Pos[1] set from storage dynagen_creator: PosTemp[1]