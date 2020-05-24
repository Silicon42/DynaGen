
scoreboard players operation #checkerMathX DGvar = #xChunk DGvar
scoreboard players operation #checkerMathZ DGvar = #zChunk DGvar
scoreboard players operation #checkerMathX DGvar %= 2 const
scoreboard players operation #checkerMathZ DGvar %= 2 const

execute if score #checkerMathX DGvar matches 0 if score #checkerMathZ DGvar matches 0 run setblock ~ 1 ~ minecraft:structure_block{mode:"LOAD",posX:-14,posY:0,posZ:-14,name:"dynagen_example:overlap_red"}
execute if score #checkerMathX DGvar matches 1 if score #checkerMathZ DGvar matches 0 run setblock ~ 1 ~ minecraft:structure_block{mode:"LOAD",posX:-14,posY:0,posZ:-14,name:"dynagen_example:overlap_green"}
execute if score #checkerMathX DGvar matches 0 if score #checkerMathZ DGvar matches 1 run setblock ~ 1 ~ minecraft:structure_block{mode:"LOAD",posX:-14,posY:0,posZ:-14,name:"dynagen_example:overlap_blue"}
execute if score #checkerMathX DGvar matches 1 if score #checkerMathZ DGvar matches 1 run setblock ~ 1 ~ minecraft:structure_block{mode:"LOAD",posX:-14,posY:0,posZ:-14,name:"dynagen_example:overlap_yellow"}
setblock ~1 1 ~ minecraft:redstone_block