# make sure that both the structure block and redstone block get removed
# also keep in mind that this must never happen at y=0

# get the rotation of the structure as a score, used later by read_branch_index but also prevents repeated traversal of NBT paths
execute store result score #direction DGvar run data get storage dynagen: JunctionList[0].Rotation

# place the structure block with the proper rotations and offsets so that the connecting Junction in the structure to be loaded
#    overlaps the one just used to generate it, NBT tags are automatically generated for your use by scanning the structure with
#    DynaGen Creator's scan_structure function
#TODO: fix the offsets and rotation of the structure blocks to actually load the real structure properly once the
#    pre-processor can pre-make the data tags
execute if score #direction DGvar matches 0 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/corridors/t_intersection"}
execute if score #direction DGvar matches 1073741824 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/corridors/t_intersection"}
execute if score #direction DGvar matches -2147483648 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/corridors/t_intersection"}
execute if score #direction DGvar matches -1073741824 run setblock ~ ~ ~ structure_block{mode:"LOAD",name:"dg_templates:complex/corridors/t_intersection"}

# must be placed above or below to prevent directionality issues
setblock ~ ~-1 ~ redstone_block

# read data in the Junction that was placed at this location due to the structure loading if applicable
#NOTE: not applicable if the structure has no special data to store, so remove if not needed for this structure
function dynagen:lib/structure/read_branch_index

# any additional processing should be done here
#    for example entity rotation fixing if it's important, since entites saved in structures lose their rotation
