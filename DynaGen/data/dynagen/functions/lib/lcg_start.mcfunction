#must be run once if you want to seed loot containers, structure integrity, or use in_cave_wall placement

#INPUT: #packSalt DGvar

function dynagen:lib/get_pack_chunk_seed
scoreboard players operation #lcgSeed DGvar = #chunkSeed DGvar