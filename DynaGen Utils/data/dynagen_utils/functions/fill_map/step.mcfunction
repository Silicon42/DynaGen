tp ~144 ~ ~
scoreboard players remove indexI FillMap 1
execute if score indexI FillMap matches 0 run function dynagen_utils:fill_map/next_row
#need a small delay shim since the chunks aren't loaded by the tp'd player until the next tick
schedule function dynagen_utils:fill_map/check_area 1t
execute if score indexI FillMap matches 1.. run schedule function dynagen_utils:fill_map/wait 2s
