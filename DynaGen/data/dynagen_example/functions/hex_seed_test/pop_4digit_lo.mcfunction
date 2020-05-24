#makes 4 8*8 squares of blocks in the chunk where each represents a hexadecimal digit of the lower half of the chunk seed via concrete colors

scoreboard players set #packSalt DGvar 0
function dynagen:lib/get_pack_chunk_seed

execute positioned ~4 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-4 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~4 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-4 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
clone ~4 1 ~-8 ~7 1 ~7 ~ 1 ~-8
clone ~-4 1 ~-8 ~-1 1 ~7 ~-8 1 ~-8