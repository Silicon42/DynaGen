#attempts to emulate a simplified version of vanilla dungeon generation, has a high failure rate
#it does this by picking several locations in the chunk from the starting y-height and 63 blocks above that inclusive, checking for air at those locations and then checking for underground blocks such as stone, dirt, etc. above, below and to at least one side.
#only allows 1 success per chunk

#INPUT: #attempts DGvar (how many attempts to make, suggested: 4), requires lcg_start.mcfunction to have been run, execution context needs to be positioned ~-8 ~y ~-8 from where execution starts when populating (chunk position 0 y 0) (y should be 32-55 for the Nether and at least 11 for the overworld), the y height is the minimum height at which it will select and can be adjusted if you wish but should not be any less than 9
#OUTPUT: #wallsFound DGvar (0 if ceiling or floor not found), #attempts DGvar (shows how many attempts were left), entity's x, y, and z position and horizontal rotation
#rotation denotes which direction the walls are, if 1 wall was found, it is toward that wall, if 2 walls found, it points to their intersection, if 3 walls found, it points to the middle, if 4 walls found, it will point towards +X (-90 degrees)

#reset entity location to match execution context
tp ~ ~ ~
function dynagen:lib/lcg_next
scoreboard players operation #chunkIndex DGvar = #lcgSeed DGvar
#constrain max height range to 64, most useful locations are in a small range so by doing this we need less attempts
scoreboard players operation #chunkIndex DGvar %= 16384 const
function dynagen:lib/coord_btrees/read_chunk_index

#check that it's in a cave, and that there is a floor and ceiling
execute positioned as @s if block ~ ~ ~ cave_air if block ~ ~4 ~ #dynagen:underground if block ~ ~-4 ~ #dynagen:underground run function dynagen:lib/placement/wall_check

scoreboard players remove #attempts DGvar 1

execute if score #wallsFound DGvar matches 0 if score #attempts DGvar matches 1.. run function dynagen:lib/placement/in_cave_wall