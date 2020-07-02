#aligns the marker to the map grid
execute store result entity @s Pos[0] double 128 run data get entity @s Pos[0] .0078125
execute store result entity @s Pos[2] double 128 run data get entity @s Pos[2] .0078125

#move marker to the upper left corner of the map and the user to the center
execute positioned as @s run tp @p[tag=tiny_seed_user] ~ ~ ~
execute positioned as @s run tp ~-64 ~ ~-64

#get the block coords to use as chunk coords
execute store result score #xChunk DGvar run data get entity @s Pos[0]
execute store result score #zChunk DGvar run data get entity @s Pos[2]

function dynagen_utils:tiny_seed/row_shim
