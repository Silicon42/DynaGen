#gets data from the structure block, initializes values for the scan and starts the recursive scanning function
# activated by using the save tool (a special item frame provided to the user) on the side of a save structure block,

#save a copy of the data in the structure block to prevent lag from accessing multiple fields
data modify storage dynagen_creator: SaveBlock set from block ^ ^ ^-1

#move to the corner of the structure region
execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.x
execute store result score #offset DGCvar run data get storage dynagen_creator: SaveBlock.posX
execute store result storage dynagen_creator: PosTemp[0] double 1 run scoreboard players operation #coord DGCvar += #offset DGCvar

execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.y
execute store result score #offset DGCvar run data get storage dynagen_creator: SaveBlock.posY
execute store result storage dynagen_creator: PosTemp[1] double 1 run scoreboard players operation #coord DGCvar += #offset DGCvar

execute store result score #coord DGCvar run data get storage dynagen_creator: SaveBlock.z
execute store result score #offset DGCvar run data get storage dynagen_creator: SaveBlock.posZ
execute store result storage dynagen_creator: PosTemp[2] double 1 run scoreboard players operation #coord DGCvar += #offset DGCvar

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
