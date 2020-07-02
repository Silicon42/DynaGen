#handles loot table seeding and junction discovery for the first part of the structure placed

#OUTPUT: dynagen:JunctionList[] >> contains entries of all the junctions in the loaded structure
#    in the format of {Data:{Pool:"<name>"},Pos:[<x>,<y>,<z>],Rotation:<rotation>}

#get the direction the structure loaded in
#South/no root junction assumes default orientation
#NOTE: will break loading substurctures if orientation doesn't match expected values
#TODO: tie checking the orientation to a flag so that the above problem can't happen
#execute if block ~ ~ ~ barrel[facing=south] run 
scoreboard players set #direction DGvar 0
execute if block ~ ~ ~ barrel[facing=west] run scoreboard players set #direction DGvar 1073741824
execute if block ~ ~ ~ barrel[facing=north] run scoreboard players set #direction DGvar -2147483648
execute if block ~ ~ ~ barrel[facing=east] run scoreboard players set #direction DGvar -1073741824
#get the list data and the root location
data modify storage dynagen: RootJunction set from block ~ ~ ~
execute store result score #xCoord DGvar run data get storage dynagen: RootJunction.x
execute store result score #yCoord DGvar run data get storage dynagen: RootJunction.y
execute store result score #zCoord DGvar run data get storage dynagen: RootJunction.z

#copy the loot list so that we don't keep traversing such a long path every time we need data
data modify storage dynagen: IndexList set from storage dynagen: RootJunction.Items[0].tag.LootList
#get the length of the list so we can loop over it
execute store result score #index DGvar run data get storage dynagen: IndexList
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/process_loot

#copy the Junction list so that we don't keep traversing such a long path every time we need data
data modify storage dynagen: IndexList set from storage dynagen: RootJunction.Items[0].tag.JunctionList
#get the length of the list so we can loop over it
execute store result score #index DGvar run data get storage dynagen: IndexList
execute if score #index DGvar matches 1.. run function dynagen:lib/structure/create_junction_list