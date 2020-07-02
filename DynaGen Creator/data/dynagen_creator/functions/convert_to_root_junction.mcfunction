#converts the jukebox block to Dynagen's Junction format using the completed Master Lists

#change the block to a root junction block (barrel w/ item for NBT storage)
setblock ~ ~ ~ barrel{Items:[{id:"book",Count:1b,tag:{LootList:[],JunctionList:[]}}]}

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
function dynagen_creator:make_local_loot_list
execute store result score #listIndex DGCvar run data get storage dynagen_creator: MasterJunctionList
function dynagen_creator:make_local_junction_list

#copy the new local lists to the item's "tag" NBT tag
data modify block ~ ~ ~ Items[0].tag set from storage dynagen_creator: ItemData