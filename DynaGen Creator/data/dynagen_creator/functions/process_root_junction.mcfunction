#change the block to a root junction block (barrel w/ item for NBT storage)
setblock ~ ~ ~ barrel{Items:[{id:"book",Count:1b}],CustomName:'{"text":"Root Junction Block"}'}

#copy data to the junction block so it doesn't need to be replaced if the structure is edited
data modify storage dynagen_creator: ItemData set value {StructPos:[0b,0b,0b]}

#store the structure position of the junction block, used for LOAD block generation
scoreboard players operation #temp DGCvar = #sizeX DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[0] byte 1 run scoreboard players operation #temp DGCvar -= #xIndex DGCvar
scoreboard players operation #temp DGCvar = #sizeY DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[1] byte 1 run scoreboard players operation #temp DGCvar -= #yIndex DGCvar
scoreboard players operation #temp DGCvar = #sizeZ DGCvar
execute store result storage dynagen_creator: ItemData.StructPos[2] byte 1 run scoreboard players operation #temp DGCvar -= #zIndex DGCvar

#copy data to the actual item
data modify block ~ ~ ~ Items[0].tag set from storage dynagen_creator: ItemData
