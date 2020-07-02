
#determine direction by dividing the range into 4 equal sections and then load the base structure
execute if score #lcgSeed DGvar matches 0..1073741823 run setblock ~ ~ ~ minecraft:structure_block{name:"dg_template:complex_base",posX:-32,posZ:-32,mode:"LOAD"}
execute if score #lcgSeed DGvar matches 1073741824.. run setblock ~ ~ ~ minecraft:structure_block{name:"dg_template:complex_base",posX:32,posZ:-32,rotation:"CLOCKWISE_90",mode:"LOAD"}
execute if score #lcgSeed DGvar matches ..-1073741825 run setblock ~ ~ ~ minecraft:structure_block{name:"dg_template:complex_base",posX:32,posZ:32,rotation:"CLOCKWISE_180",mode:"LOAD"}
execute if score #lcgSeed DGvar matches -1073741824..-1 run setblock ~ ~ ~ minecraft:structure_block{name:"dg_template:complex_base",posX:-32,posZ:32,rotation:"COUNTERCLOCKWISE_90",mode:"LOAD"}
setblock ~ ~1 ~ redstone_block