function dynagen_utils:tiny_seed/step
tp ~ ~ ~1
scoreboard players add #zChunk DGvar 1
scoreboard players remove #xChunk DGvar 128
scoreboard players set @s DGvar 0

schedule function dynagen_utils:tiny_seed/row_shim 1t