# picks a random corridor to load, rename and add entries in a similar manner for your own structures

# randomize the pick from the provided pool
function dynagen:lib/lcg_next
scoreboard players operation #junctionSeed DGvar = #lcgSeed DGvar

# in this case we have 1 option with weight 3/5 and another 2 with weight 1/5, where #complexCorridor DGTemplateVar == 5
scoreboard players operation #junctionSeed DGvar %= #complexCorridor DGTemplateVar
execute if score #junctionSeed DGvar matches 0..2 run function dg_templates:complex/substructures/corridors/long
execute if score #junctionSeed DGvar matches 3 run function dg_templates:complex/substructures/corridors/short
execute if score #junctionSeed DGvar matches 4 run function dg_templates:complex/substructures/corridors/t_intersection