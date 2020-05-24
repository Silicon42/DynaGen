#punches holes in the mask base with size dependent on #holeSize
execute if score #holeSize DGvar matches 1 run fill ~ 2 ~ ~3 2 ~7 air
execute if score #holeSize DGvar matches 2 run fill ~-4 2 ~ ~3 2 ~7 air
execute if score #holeSize DGvar matches 3 run fill ~-12 2 ~ ~3 2 ~7 air
scoreboard players remove #indexI DGvar 1
execute if score #indexI DGvar matches 1.. positioned ~16 0 ~ run function dynagen_utils:mask_hex/hole_punch