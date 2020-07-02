# Your #packSalt should not be 0, it should be a pseudo-randomly generated 32 bit signed int unique to your pack
# an easy way to do this is to make a Minecraft world with your pack name as the seed and then run the command
# /execute store result score <ScoreName> <ObjectiveName> run seed
# and then see what the score has in it
scoreboard players set #packSalt DGvar 0
# if you only need the seed for calculating loot or structure integrity/layout and not chance of the structure spawning in general, you can instead call:
#function dynagen:lib/get_core_chunk_seed
# and ommit next scoreboard and execute commands
function dynagen:lib/get_pack_chunk_seed

# this gives your structure a chance to spawn of (the size of your match range)/(<chance> const)
# NOTE: please remember to change the name of <chance> to the value of your constant and add it to the scoreboard if it's not there already, this is to ensure that it does not conflict with other packs
scoreboard players operation #chunkSeed DGvar %= <chance> const
# if you want the structure placed at a fixed height, there is no need for a placement function, instead run your load function
execute if score #chunkSeed DGvar matches 0 run function dg_templates:entity_placement_shim_structname
