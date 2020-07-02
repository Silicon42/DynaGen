#returns the chunk seed for the pack requesting it
#IMPORTANT: prior to calling this function, #packSalt must be set to the pack's own 32-bit salt
# this ensures that it uses the salt specific to the calling pack as opposed to the previous pack's salt
#the salt is intended to make it more unlikely for different packs to have conflicts should 2 packs have similar conditions for spawning their structures and thus helps prevent them from spawning on top of each other

#make sure the brunt of the work of calculating the chunk seed only happens once no matter how many packs call this function
execute if score #chunkSeedCalcd DGvar matches 0 run function dynagen:calc_chunk_seed

#copy so that the original value doesn't get modified and require expensive re-calc
scoreboard players operation #chunkSeed DGvar = #seedCalcLoX DGvar

#add pack salt
scoreboard players operation #chunkSeed DGvar += #packSalt DGvar

#a quick round of Fibonnaci hash to mix the salt in
#1640531526.5027697035224152292074 = 2^32*(1-(golden ratio)^-1)
scoreboard players operation #chunkSeed DGvar *= 1640531527 const