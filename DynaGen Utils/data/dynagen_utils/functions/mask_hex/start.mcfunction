#meant to be run with max render distance (32)
scoreboard players operation #holeSize DGvar %= 4 const
scoreboard players operation #temp DGvar = #holeSize DGvar
execute if score #temp DGvar matches 2.. run scoreboard players operation #hexMask DGvar *= 2 const
scoreboard players operation #temp DGvar %= 2 const
execute if score #temp DGvar matches 1 run scoreboard players operation #hexMask DGvar *= 2 const

#summons marker entity to run from
summon area_effect_cloud ~ 0 ~ {Tags: ["dynagen_marker"]}
execute as @e[tag=dynagen_marker] run function dynagen_utils:mask_hex/align_marker