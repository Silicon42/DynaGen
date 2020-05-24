#gives a 1 in 8192 chance that a given chunk is "shiny"
scoreboard players set #packSalt DGvar 109407615
function dynagen:lib/get_pack_chunk_seed
scoreboard players operation #chunkSeed DGvar %= 8192 const
execute if score #chunkSeed DGvar matches 0 run fill ~-7 1 ~-7 ~6 1 ~6 diamond_block
