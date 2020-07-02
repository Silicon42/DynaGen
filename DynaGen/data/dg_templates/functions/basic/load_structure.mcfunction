# make sure that the structure loading removes the structure block and redstone block
# also keep in mind that this must never happen at y=0
setblock ~ ~ ~ structure_block{mode:"LOAD",posX:-2,posY:0,posZ:-2,name:"dg_templates:basic_structure"}
setblock ~ ~1 ~ redstone_block