scoreboard players operation #chunkIndex DGvar *= 2 const
execute if score #chunkIndex DGvar matches ..-1 positioned ~ ~1 ~ run function dynagen:lib/coord_btrees/read_chunk_index/bit23
execute if score #temp DGvar matches 0 run function dynagen:lib/coord_btrees/read_chunk_index/bit23