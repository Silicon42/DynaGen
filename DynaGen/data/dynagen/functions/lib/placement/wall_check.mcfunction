#checks for walls made of dirt, stone, etc, used by in_cave_wall and in_cliff_face

#OUTPUT: #wallsFound DGvar, entity's horizontal rotation
#rotation denotes which direction the walls are, if 1 wall was found, it is toward that wall, if 2 walls found, it points to their intersection, if 3 walls found, it points to the middle, if 4 walls found, it will point towards +X(-90 degrees)

scoreboard players set #wallsFound DGvar 0

execute if block ~ ~ ~4 #dynagen:underground store result score #temp DGvar positioned as @s run tp ~ ~ ~1
scoreboard players operation #wallsFound DGvar += #temp DGvar
execute if block ~-4 ~ ~ #dynagen:underground store result score #temp DGvar positioned as @s run tp ~-1 ~ ~
scoreboard players operation #wallsFound DGvar += #temp DGvar
execute if block ~ ~ ~-4 #dynagen:underground store result score #temp DGvar positioned as @s run tp ~ ~ ~-1
scoreboard players operation #wallsFound DGvar += #temp DGvar
execute if block ~4 ~ ~ #dynagen:underground store result score #temp DGvar positioned as @s run tp ~1 ~ ~
scoreboard players operation #wallsFound DGvar += #temp DGvar
execute facing entity @s feet run tp @s ~ ~ ~ ~ ~
