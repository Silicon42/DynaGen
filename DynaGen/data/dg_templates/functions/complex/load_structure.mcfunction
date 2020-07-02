# This function handles loading more complex structures with random components similar to the way that vanilla villages are
# It is provided as a template since DynaGen has no way of knowing the contents of each pool, names and namespaces of each
#    structure, weights with which to select them, or offsets at which each structure should be loaded relative to it's
#    junctions without excessive useage of very slow NBT data commands

# Make sure that the structure loading removes the structure block and redstone block
# Also keep in mind that this must never happen at y=0

# The following is mostly an explanation on how this works however, this it's not strictly neccessary to understand to create
#    your own submodule. If you want to create your own structures to be compatible with this pack, there is a companion pack
#    called DynaGen Creator, which does most of the hard parts like aligning your structure loading and pre-processing your
#    structure for you to include the data mentioned below along with it

# The newly loaded structure has a horizontal barrel that contains an item with data in it's tag:{} NBT tag, such as a list of
#    references to the locations of all loot containers and a list of the locations of Junctions in the structure along with
#    additional data on how to process them, such as a string for which pool to use that the module maker can match to determine
#    which set of structures to pick from based on the current value of #lcgSeed DGvar, and whether the structure to be loaded
#    in should be randomly rotated (not implemented yet)

#NOTE: as a limitation of this system, this barrel must be at a fixed offset such that regardless of the rotation the structure
#   is loaded in, the barrel will always be what replaces the structure block, i.e. it's at the location that the rest of the 
#   structure rotates around.
# Later there will likely be an option to randomly rotate the structure here with another template function instead of these setblock commands
setblock ~ ~ ~ structure_block{mode:"LOAD",posX:-2,posY:0,posZ:-2,name:"dg_templates:complex_structure_base"}
setblock ~ ~1 ~ redstone_block
# processes any loot containers and creates a list of Junctions to iterate over
function dynagen:lib/structure/read_root_index
# remove the barrel if not being handled by anything else
setblock ~ ~ ~ dirt
# set the max number of rolls away from the root that the structure can generate
scoreboard players set #rollDepth DGvar 4
function dg_templates:complex/process_junction_rolls
function dg_templates:complex/cap_remaining_junctions