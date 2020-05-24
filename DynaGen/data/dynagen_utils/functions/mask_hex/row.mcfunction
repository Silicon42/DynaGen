execute positioned as @s run function dynagen_utils:mask_hex/hole_punch
tp ~ 0 ~16
scoreboard players remove #indexJ DGvar 1
execute if score #indexJ DGvar matches 1.. run scoreboard players set #indexI DGvar 64