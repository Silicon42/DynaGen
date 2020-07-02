scoreboard players set #temp DGvar 0

execute if score #chunkIndex DGvar matches ..-1 positioned ~ ~128 ~ run function dynagen:lib/coord_btrees/read_chunk_index/bit30
execute if score #temp DGvar matches 0 run function dynagen:lib/coord_btrees/read_chunk_index/bit30