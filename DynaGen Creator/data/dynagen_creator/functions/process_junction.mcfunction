#make position and value sub-entries
data modify storage dynagen_creator: MasterJunctionList append value {}
data modify storage dynagen_creator: MasterJunctionList[-1].Pos set from entity @s Pos
execute if block ~ ~ ~ chain_command_block[facing=south] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value 0
execute if block ~ ~ ~ chain_command_block[facing=west] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value 1073741824
execute if block ~ ~ ~ chain_command_block[facing=north] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value -2147483648
execute if block ~ ~ ~ chain_command_block[facing=east] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value -1073741824
data modify storage dynagen_creator: MasterJunctionList[-1].Pool set from block ~ ~ ~ Command

#change the block to a junction block (jukebox w/ item for NBT storage)
setblock ~ ~ ~ jukebox{RecordItem:{id:"book",Count:1b}}
setblock ~ ~1 ~ structure_void

#copy data to the junction block so it doesn't need to be replaced if the structure is edited
data modify storage dynagen_creator: ItemData set value {StructPos:[0b,0b,0b],Junction:1b}
data modify storage dynagen_creator: ItemData.Pool set from storage dynagen_creator: MasterJunctionList[-1].Pool
data modify storage dynagen_creator: ItemData.Rotation set from storage dynagen_creator: MasterJunctionList[-1].Rotation

#store the structure position of the junction block, used for LOAD block generation
scoreboard players operation #temp DGCvar = #sizeX DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[0] byte 1 run scoreboard players operation #temp DGCvar -= #xIndex DGCvar
scoreboard players operation #temp DGCvar = #sizeY DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[1] byte 1 run scoreboard players operation #temp DGCvar -= #yIndex DGCvar
scoreboard players operation #temp DGCvar = #sizeZ DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[2] byte 1 run scoreboard players operation #temp DGCvar -= #zIndex DGCvar

#copy data to the actual item
data modify block ~ ~ ~ RecordItem.tag set from storage dynagen_creator: ItemData
