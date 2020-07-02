#attempts to place the structure at the avg height of the corners of the chunk, fails and won't move the entity if all corners fail to place

#OUTPUT: entity y-positon, fails to change if all height checks fail

scoreboard players set #cornerSuccess DGvar 0
scoreboard players set #yAvg DGvar 0

execute positioned ~-7 ~ ~-7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
execute if score #placeSuccess DGvar matches 1 run scoreboard players operation #yAvg DGvar += #yNext DGvar
scoreboard players operation #cornerSuccess DGvar += #placeSuccess DGvar

execute positioned ~7 ~ ~-7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
execute if score #placeSuccess DGvar matches 1 run scoreboard players operation #yAvg DGvar += #yNext DGvar
scoreboard players operation #cornerSuccess DGvar += #placeSuccess DGvar

execute positioned ~-7 ~ ~7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
execute if score #placeSuccess DGvar matches 1 run scoreboard players operation #yAvg DGvar += #yNext DGvar
scoreboard players operation #cornerSuccess DGvar += #placeSuccess DGvar

execute positioned ~7 ~ ~7 run function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 store result score #yNext DGvar run data get entity @s Pos[1]
execute if score #placeSuccess DGvar matches 1 run scoreboard players operation #yAvg DGvar += #yNext DGvar
scoreboard players operation #cornerSuccess DGvar += #placeSuccess DGvar

scoreboard players operation #yAvg DGvar /= #cornerSuccess DGvar
#reset entity x and z position to center and y to the calculated value
tp ~ ~ ~
execute unless score #cornerSuccess DGvar matches 0 store result entity @s Pos[1] double 1 run scoreboard players get #yAvg DGvar