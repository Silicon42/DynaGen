#mostly intended for debug purposes, gets Dynagen's unmodified core chunk seed that is used to calculate all pack seeds in a scoreboard value

#make sure the brunt of the work of calculating the chunk seed only happens once no matter how many packs call this function
execute if score #seedCalcdBool DGvar matches 0 run function dynagen:calc_chunk_seed
#also keeps track of how many packs have asked for a chunk seed for this chunk for debugging purposes
scoreboard players add #seedCalcdBool DGvar 1

#copy so that the original value doesn't get modified and require expensive re-calc
scoreboard players operation #chunkSeed DGvar = #seedCalcLoX DGvar
