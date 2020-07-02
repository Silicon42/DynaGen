#assumes player has at least a render distance of 5 set since that's the largest square that fits in a map's update radius
#must have a valid mapScale or else it won't work
#not multiplayer friendly, only intended to be used to test random distribution
#this will break if more than one person tries to use it simultaneously
tag @s add FillMapper

execute if score mapScale FillMap matches 4 run scoreboard players set mapperSize FillMap 15
execute if score mapScale FillMap matches 3 run scoreboard players set mapperSize FillMap 8
execute if score mapScale FillMap matches 2 run scoreboard players set mapperSize FillMap 4
execute if score mapScale FillMap matches 1 run scoreboard players set mapperSize FillMap 2

#initialize the indicies, they count down toward 0 since it's more efficient to compare with constant values
scoreboard players operation indexI FillMap = mapperSize FillMap
scoreboard players operation indexJ FillMap = mapperSize FillMap

function dynagen_utils:fill_map/step