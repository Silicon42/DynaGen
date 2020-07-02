#handles loot table seeding and junction discovery for substructures of a larger randomized structure

#OUTPUT: adds to dynagen:JunctionList[] >> contains entries of all the junctions in the loaded structure
#    in the format of {Data:{Pool:"<name>"},Pos:[<x>,<y>,<z>],Rotation:<rotation>}

#get the list data and the current location
data modify storage dynagen: Junction set from block ~ ~ ~ RecordItem.tag
execute store result score #xCoord DGvar run data get storage dynagen: JunctionList[0].Pos[0]
execute store result score #yCoord DGvar run data get storage dynagen: JunctionList[0].Pos[1]
execute store result score #zCoord DGvar run data get storage dynagen: JunctionList[0].Pos[2]

#copy the loot list so that we don't keep traversing such a long path every time we need data
data modify storage dynagen: IndexList set from storage dynagen: Junction.LootList
#get the length of the list so we can loop over it
execute store result score #index DGvar run data get storage dynagen: IndexList
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/process_loot

#copy the Junction list so that we don't keep traversing such a long path every time we need data
data modify storage dynagen: IndexList set from storage dynagen: Junction.JunctionList
#get the length of the list so we can loop over it
execute store result score #index DGvar run data get storage dynagen: IndexList
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/create_junction_list