#places the structure randomly somewhere between #yMin DGvar and the surface
# or if on_surface fails, between #yMin DGvar and the height the entity was summoned at (should be < 30 if including deep oceans, < 62 if not including water biomes)

#INPUT: #yMin DGvar (must be >= 1, preferably 6 to prevent damage to y=0 bedrock), determines minimum height of generation, useful if your structure might potentially descend and damage bedrock,
# additionally, entity y-position (must be >= #yMin DGvar), determines fallback max height if spreadplayers fails
#OUTPUT: entity y-position

function dynagen:lib/placement/on_surface
execute store result score #yMax DGvar run data get entity @s Pos[1]
scoreboard players operation #yMax DGvar -= #yMin DGvar
scoreboard players operation #randHeight DGvar = #seedCalcLoX DGvar
scoreboard players operation #randHeight DGvar %= #yMax DGvar
scoreboard players operation #randHeight DGvar += #yMin DGvar
execute store success score #placeSuccess DGvar if score #randHeight DGvar >= #yMin DGvar
execute store result entity @s Pos[1] double 1 run scoreboard players get #yMax DGvar