scoreboard players set #packSalt DGvar 0
function dynagen:lib/get_pack_chunk_seed
#would be better for performance to have it's own set of functions that do this in only one fill and less math, but this is just for debug purposes and I'm lazy
execute positioned ~-8 1 ~-8 run function dynagen_example:hex_seed_test/hex_fill
clone ~-8 1 ~-8 ~-5 1 ~-1 ~-4 1 ~-8
clone ~-8 1 ~-8 ~-1 1 ~-1 ~0 1 ~-8
clone ~-8 1 ~-8 ~7 1 ~-1 ~-8 1 ~0