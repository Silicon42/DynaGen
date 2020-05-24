#kill the marker entity to take it off the @e list
kill

#gets the marker's x and z chunk coords and puts them in scoreboards
#they are put in scoreboards instead of on the entity since we need it later
data modify storage dynagen: PosTemp set from entity @s Pos
execute store result score #xChunk DGvar run data get storage dynagen: PosTemp[0] .0625
execute store result score #zChunk DGvar run data get storage dynagen: PosTemp[2] .0625

#then scales them back up to world coords thus moving the marker to the chunk corner
execute store result storage dynagen: PosTemp[0] double 16 run scoreboard players get #xChunk DGvar
execute store result storage dynagen: PosTemp[2] double 16 run scoreboard players get #zChunk DGvar
data modify entity @s Pos set from storage dynagen: PosTemp

#move reference postion away from the chunk edges to prevent block updates from loading chunks
execute positioned as @s positioned ~8 0 ~8 run function dynagen:populate_if_new
