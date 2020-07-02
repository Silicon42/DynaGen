#attempts to place the structure on the highest height of the corners of the chunk

#INPUT: #yMax DGvar, specifies the minimum generation height, if you want this to fail if all corners fail, check that #yMax is not the same as the value you set it to before loading your structure.
#OUTPUT: entity y-position
#NOTE: does not check fully into the corners on the negative sides to prevent potential issues with chunk loading

execute positioned ~-7 ~ ~-7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
scoreboard players operation #yMax DGvar > #yNext DGvar

execute positioned ~7 ~ ~-7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
scoreboard players operation #yMax DGvar > #yNext DGvar

execute positioned ~-7 ~ ~7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
scoreboard players operation #yMax DGvar > #yNext DGvar

execute positioned ~7 ~ ~7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
scoreboard players operation #yMax DGvar > #yNext DGvar

#reset entity x and z position to center and y to the calculated value
tp ~ ~ ~
execute store result entity @s Pos[1] double 1 run scoreboard players get #yMax DGvar