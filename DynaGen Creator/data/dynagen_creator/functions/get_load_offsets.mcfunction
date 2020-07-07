#calculates the offsets that a LOAD structure block needs to load the structure in any orientation aligned to the selected Junction block
#TODO: make this easy to cut and paste into a function
#TODO: add inclusion of the structure name
data modify storage dynagen_creator: ItemData set value {0:{rotation:"NONE"},90:{rotation:"CLOCKWISE_90"},180:{rotation:"CLOCKWISE_180"},270:{rotation:"COUNTERCLOCKWISE_90"}}
execute if block ^ ^ ^-1 jukebox run data modify storage dynagen_creator: JunctionTemp set from block ^ ^ ^-1 RecordItem.tag
execute if block ^ ^ ^-1 barrel run data modify storage dynagen_creator: JunctionTemp set from block ^ ^ ^-1 Items[0].tag
setblock ~ ~ ~ jukebox{RecordItem:{id:"book",Count:1b}}

execute store result storage dynagen_creator: ItemData.0.posX int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[0]
execute store result storage dynagen_creator: ItemData.0.posY int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[1]
execute store result storage dynagen_creator: ItemData.0.posZ int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[2]

execute store result storage dynagen_creator: ItemData.90.posX int 1 run data get storage dynagen_creator: JunctionTemp.StructPos[2]
execute store result storage dynagen_creator: ItemData.90.posY int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[1]
execute store result storage dynagen_creator: ItemData.90.posZ int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[0]

execute store result storage dynagen_creator: ItemData.180.posX int 1 run data get storage dynagen_creator: JunctionTemp.StructPos[0]
execute store result storage dynagen_creator: ItemData.180.posY int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[1]
execute store result storage dynagen_creator: ItemData.180.posZ int 1 run data get storage dynagen_creator: JunctionTemp.StructPos[2]

execute store result storage dynagen_creator: ItemData.270.posX int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[2]
execute store result storage dynagen_creator: ItemData.270.posY int -1 run data get storage dynagen_creator: JunctionTemp.StructPos[1]
execute store result storage dynagen_creator: ItemData.270.posZ int 1 run data get storage dynagen_creator: JunctionTemp.StructPos[0]

execute if data storage dynagen_creator: JunctionTemp{Rotation:0} run function dynagen_creator:offsets_south
execute if data storage dynagen_creator: JunctionTemp{Rotation:1073741824} run function dynagen_creator:offsets_west
execute if data storage dynagen_creator: JunctionTemp{Rotation:-2147483648} run function dynagen_creator:offsets_north
execute if data storage dynagen_creator: JunctionTemp{Rotation:-1073741824} run function dynagen_creator:offsets_east

data remove storage dynagen_creator: ItemData.0
data remove storage dynagen_creator: ItemData.90
data remove storage dynagen_creator: ItemData.180
data remove storage dynagen_creator: ItemData.270
data modify block ~ ~ ~ RecordItem.tag set from storage dynagen_creator: ItemData