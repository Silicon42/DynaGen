#gets Dynagen's unmodified core chunk seed that is used to calculate all pack seeds
#fine to use if it's not for determining if a structure spawns or not

#make sure the brunt of the work of calculating the chunk seed only happens once no matter how many packs call this function
execute if score #chunkSeedCalcd DGvar matches 0 run function dynagen:calc_chunk_seed

#copy so that the original value doesn't get modified and require expensive re-calc
scoreboard players operation #chunkSeed DGvar = #seedCalcLoX DGvar
