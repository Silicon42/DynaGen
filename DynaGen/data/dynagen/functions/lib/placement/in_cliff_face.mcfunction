#attempts to place structures such that they are anchored to a cliff face, behaves similar to in_cave_wall, except it checks that there is NO ceiling or floor, mostly useful for mountain biomes, the Nether, and the End

#INPUT: #attempts DGvar (how many attempts to make, suggested: 4), requires lcg_start.mcfunction to have been run, execution context needs to be positioned ~-8 ~y ~-8 from where execution starts when populating (chunk position 0 y 0) (y should be 36 for the Nether and at least 67 for the overworld), the y height is the minimum height at which it will select and can be adjusted if you wish but should not be any less than 9
#OUTPUT: #wallsFound DGvar (0 if ceiling or floor not found), #attempts DGvar (shows how many attempts were left), entity's x, y, and z position and horizontal rotation
#rotation denotes which direction the walls are, if 1 wall was found, it is toward that wall, if 2 walls found, it points to their intersection, if 3 walls found, it points to the middle, if 4 walls found, it will point towards +X (-90 degrees)

#reset entity location to match execution context
tp ~ ~ ~
function dynagen:lib/lcg_next
scoreboard players operation #chunkIndex DGvar = #lcgSeed DGvar
#constrain max height range to 64, most useful locations are in a small range so by doing this we need less attempts
scoreboard players operation #chunkIndex DGvar %= 16384 const
function dynagen:lib/coord_btrees/read_chunk_index

#check that it's in open air, and that there is neither a floor nor a ceiling
execute positioned as @s if block ~ ~ ~ air if block ~ ~4 ~ air if block ~ ~-4 ~ air run function dynagen:lib/placement/wall_check

scoreboard players remove #attempts DGvar 1

execute if score #wallsFound DGvar matches 0 if score #attempts DGvar matches 1.. run function dynagen:lib/placement/in_cliff_face