#makes a pattern of 4*8 rectangles in the chunk where each represents a hexadecimal digit of the chunk seed via concrete colors
scoreboard players set #packSalt DGvar 0
function dynagen:lib/get_pack_chunk_seed

execute positioned ~4 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~0 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-4 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-8 1 ~ run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~4 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~0 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-4 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
execute positioned ~-8 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill