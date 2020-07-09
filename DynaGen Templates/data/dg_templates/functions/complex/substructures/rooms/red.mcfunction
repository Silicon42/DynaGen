# make sure that both the structure block and redstone block get removed
# also keep in mind that this must never happen at y=0

# get the rotation of the structure as a score, used later by read_branch_index but also prevents repeated traversal of NBT paths
execute store result score #direction DGvar run data get storage dynagen: JunctionList[0].Rotation
#patch fix for me being dumb and not considering that structures might not be built with their parent junctions all facing the same direction
scoreboard players add #direction DGvar 1073741824
scoreboard players add #direction DGvar 1073741824

# place the structure block with the proper rotations and offsets so that the connecting Junction in the structure to be loaded
#    overlaps the one just used to generate it, NBT tags are automatically generated for your use by scanning the structure with
#    DynaGen Creator's scan_structure function
#TODO: fix the offsets and rotation of the structure blocks to actually load the real structure properly once the
#    pre-processor can pre-make the data tags
#South facing junction
execute if score #direction DGvar matches -2147483648 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/rooms/red",posX:3,posY:-1,posZ:9,rotation:"CLOCKWISE_180"}
#West facing junction
execute if score #direction DGvar matches -1073741824 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/rooms/red",posX:-9,posY:-1,posZ:3,rotation:"COUNTERCLOCKWISE_90"}
#North facing junction
execute if score #direction DGvar matches 0 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/rooms/red",posX:-3,posY:-1,posZ:-9,rotation:"NONE"}
#East facing junction
execute if score #direction DGvar matches 1073741824 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/rooms/red",posX:9,posY:-1,posZ:-3,rotation:"CLOCKWISE_90"}

# must be placed above or below to prevent directionality issues
setblock ~ ~1 ~ redstone_block

# read data in the Junction that was placed at this location due to the structure loading if applicable
#NOTE: not applicable if the structure has no special data to store, so remove if not needed for this structure
function dynagen:lib/structure/read_branch_index

# any additional processing should be done here
#    for example entity rotation fixing if it's important, since entites saved in structures lose their rotation
