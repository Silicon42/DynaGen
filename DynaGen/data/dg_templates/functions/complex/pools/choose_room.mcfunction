# picks a random room to load, rename and add entries in a similar manner for your own structures

# randomize the pick from the provided pool
function dynagen:lib/lcg_next
scoreboard players operation #junctionSeed DGvar = #lcgSeed DGvar

# in this case we have 1 option with weight 3/7 and another with weight 2/7, where #complexRoom DGTemplateVar == 7
scoreboard players operation #junctionSeed DGvar %= #complexRoom DGTemplateVar
execute if score #junctionSeed DGvar matches 0..2 run function dg_templates:complex/substructures/room_red
execute if score #junctionSeed DGvar matches 3..6 run function dg_templates:complex/substructures/room_blue
