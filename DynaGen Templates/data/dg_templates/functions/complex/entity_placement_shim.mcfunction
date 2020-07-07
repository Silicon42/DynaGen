#if the structure is just placed at a fixed height in the chunk, you don't need a shim like this
# just setblock in a structure_block in "LOAD" mode and a redstone block, preferrably in a way that they remove themselves when loading in the structure, or if utilizing structure integrity, place an {auto:1b} command block to fill them away

#the ~-0.5 is to put the enitity on the corner of the block to reduce the number of locations that the spreadplayers command can
# attempt to place it since this gets run from a command block and should not be modified since several placement functions
# including on_surface use that command
summon area_effect_cloud ~-0.5 30 ~-0.5 {Particle:"block air",Tags:["dynagen_marker"]}
execute as @e[type=area_effect_cloud,tag=dynagen_marker] run function dg_templates:complex/place_structure
