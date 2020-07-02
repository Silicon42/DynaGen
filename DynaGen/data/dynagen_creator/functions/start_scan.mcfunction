#gets data from the structure block, initializes values for the scan and starts the recursive scanning function
# will likely break if the save block is within the region being saved
# activated by using the save tool (a special item frame provided to the user) on the side of a save structure block,
# runs as and at the item frame

#save an unmodified copy of the data in the structure block since it gets overwritten and needs to be put back
data modify storage dynagen_creator: SaveBlock set from block ^ ^ ^-1

#save an unmodified copy of the structure to load back in after processing for ease of player editing
data merge block ^ ^ ^-1 {name:"dynagen_creator:unmodified",ignoreEntities:1b}
setblock ~ ~ ~ redstone_block
setblock ~ ~ ~ air

#move to the corner of the structure region
execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.x
execute store result score #temp DGCvar run data get storage dynagen_creator: SaveBlock.posX
scoreboard players operation #coord DGCvar += #temp DGCvar
execute store result storage dynagen_creator: PosTemp[0] double 1 run scoreboard players get #coord DGCvar

execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.y
execute store result score #temp DGCvar run data get storage dynagen_creator: SaveBlock.posY
scoreboard players operation #coord DGCvar += #temp DGCvar
execute store result storage dynagen_creator: PosTemp[1] double 1 run scoreboard players get #coord DGCvar

execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.z
execute store result score #temp DGCvar run data get storage dynagen_creator: SaveBlock.posZ
scoreboard players operation #coord DGCvar += #temp DGCvar
execute store result storage dynagen_creator: PosTemp[2] double 1 run scoreboard players get #coord DGCvar

data modify entity @s Pos set from storage dynagen_creator: PosTemp

#get the size to iterate over
execute store result score #sizeX DGCvar run data get storage dynagen_creator: SaveBlock.sizeX
execute store result score #sizeY DGCvar run data get storage dynagen_creator: SaveBlock.sizeY
execute store result score #sizeZ DGCvar run data get storage dynagen_creator: SaveBlock.sizeZ

#initialize the indices
scoreboard players operation #xIndex DGCvar = #sizeX DGCvar
scoreboard players operation #yIndex DGCvar = #sizeY DGCvar
scoreboard players operation #zIndex DGCvar = #sizeZ DGCvar

#initialize the lists
data modify storage dynagen_creator: MasterLootList set value []
data modify storage dynagen_creator: MasterJunctionList set value []

#start the scan
execute positioned as @s run function dynagen_creator:scan

#save the processed structure
data modify block ^ ^ ^-1 name set from storage dynagen_creator: SaveBlock.name
data modify block ^ ^ ^-1 ignoreEntities set from storage dynagen_creator: SaveBlock.ignoreEntities
setblock ~ ~ ~ redstone_block
setblock ~ ~ ~ air

#reset changes that the scan made
data merge block ^ ^ ^-1 {name:"dynagen_creator:unmodified",mode:"LOAD",rotation:"NONE",mirror:"NONE"}
setblock ~ ~ ~ redstone_block
setblock ~ ~ ~ air
data modify block ^ ^ ^-1 name set from storage dynagen_creator: SaveBlock.name
data modify block ^ ^ ^-1 ignoreEntities set from storage dynagen_creator: SaveBlock.ignoreEntities
