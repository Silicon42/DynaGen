scoreboard players set #packSalt DGvar 0
function dynagen:lib/get_pack_chunk_seed
scoreboard players operation #chunkSeed DGvar %= 4 const
execute if score #chunkSeed DGvar matches 0 run fill ~-8 1 ~-8 ~7 1 ~7 black_concrete
execute if score #chunkSeed DGvar matches 1 run fill ~-8 1 ~-8 ~7 1 ~7 light_gray_concrete
execute if score #chunkSeed DGvar matches 2 run fill ~-8 1 ~-8 ~7 1 ~7 gray_concrete
execute if score #chunkSeed DGvar matches 3 run fill ~-8 1 ~-8 ~7 1 ~7 white_concrete
