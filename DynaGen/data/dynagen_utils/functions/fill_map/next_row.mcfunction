#move the player to the start of the next row, amount varies by mapScale
execute if score mapScale FillMap matches 4 run tp ~-2016 ~ ~144
execute if score mapScale FillMap matches 3 run tp ~-1008 ~ ~144
execute if score mapScale FillMap matches 2 run tp ~-432 ~ ~144
execute if score mapScale FillMap matches 1 run tp ~-144 ~ ~144
scoreboard players remove indexJ FillMap 1
execute if score indexJ FillMap matches 1.. run scoreboard players operation indexI FillMap = mapperSize FillMap
execute if score indexJ FillMap matches 0 run function dynagen_utils:fill_map/end