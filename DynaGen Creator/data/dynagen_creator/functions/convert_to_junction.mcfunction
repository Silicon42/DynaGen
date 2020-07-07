#converts the special chain_command_block to Dynagen's Junction format using the completed Master Lists

#get the current position from the block
data modify storage dynagen_creator: JunctionTemp set from block ~ ~ ~
execute store result score #xCoord DGCvar run data get storage dynagen_creator: JunctionTemp.x
execute store result score #yCoord DGCvar run data get storage dynagen_creator: JunctionTemp.y
execute store result score #zCoord DGCvar run data get storage dynagen_creator: JunctionTemp.z

#copy master lists so as not to modify them
data modify storage dynagen_creator: MLLcopy set from storage dynagen_creator: MasterLootList
data modify storage dynagen_creator: MJLcopy set from storage dynagen_creator: MasterJunctionList
 
#make the local versions of the lists
data modify storage dynagen_creator: ItemData set value {LootList:[],JunctionList:[]}
execute store result score #listIndex DGCvar run data get storage dynagen_creator: MasterLootList
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_loot_list
execute store result score #listIndex DGCvar run data get storage dynagen_creator: MasterJunctionList
execute if score #listIndex DGCvar matches 1.. run function dynagen_creator:make_local_junction_list

#copy the new local lists to the item's "tag" NBT tag
data modify block ~ ~ ~ RecordItem.tag merge from storage dynagen_creator: ItemData