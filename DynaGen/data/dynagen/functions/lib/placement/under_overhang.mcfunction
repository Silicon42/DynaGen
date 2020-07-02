#attempts to place the structure attached to the underside of an overhang, behaves similarly to in_cave_wall and in_cliff_face, except it checks that there is a ceiling and NO walls nor floor, mostly useful for the Nether and End

#INPUT: #attempts DGvar (how many attempts to make, suggested: 4), requires lcg_start.mcfunction to have been run, execution context needs to be positioned ~-8 ~y ~-8 from where execution starts when populating (chunk position 0 y 0) (y should be approx. 40 for the Nether and ___ for the End), the y height is the minimum height at which it will select and can be adjusted if you wish but should not be any less than 9
#OUTPUT: #attempts DGvar (shows how many attempts were left, if >=0, it succeeded, if -1 it failed), entity's x, y, and z position

#reset entity location to match execution context
tp ~ ~ ~
function dynagen:lib/lcg_next
scoreboard players operation #chunkIndex DGvar = #lcgSeed DGvar
#constrain max height range to 64, most useful locations are in a small range so by doing this we need less attempts
scoreboard players operation #chunkIndex DGvar %= 16384 const
function dynagen:lib/coord_btrees/read_chunk_index

#check that it's in open air, and that there is a ceiling but no floor
execute positioned as @s if block ~ ~ ~ air if block ~ ~4 ~ #dynagen:underground if block ~ ~-4 ~ air run function dynagen:lib/placement/wall_check

scoreboard players remove #attempts DGvar 1

execute unless score #wallsFound DGvar matches 0 if score #attempts DGvar matches 1.. run function dynagen:lib/placement/under_overhang