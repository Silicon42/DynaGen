scoreboard players set #seedCalcdBool DGvar 0
function #dynagen_utils:tiny_pop

scoreboard players add #xChunk DGvar 1
#used as an index for the x direction
scoreboard players add @s DGvar 1
execute if score @s DGvar matches ..127 positioned ~1 ~ ~ run function dynagen_utils:tiny_seed/step