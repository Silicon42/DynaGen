#decrement the index and move marker to next row
scoreboard players remove #yIndex DGCvar 1
tp @s ~ ~1 ~

#reset the x position and index
scoreboard players operation #xIndex DGCvar = #sizeX DGCvar
data modify entity @s Pos[0] set from storage dynagen_creator: PosTemp[0]