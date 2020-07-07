# Scans the area that the targeted structure block is set to by looping recursively

#TODO: add ability to include already processed junctions
#TODO: clean up redundant lists based on root junction
#TODO: add LOAD structure block item creation

#process special blocks
execute if block ~ ~ ~ #dynagen_creator:loot_containers if data block ~ ~ ~ LootTable run data modify storage dynagen_creator: MasterLootList append from entity @s Pos
execute if block ~ ~ ~ chain_command_block{CustomName:'{"text":"Junction Block"}'} run function dynagen_creator:process_junction
execute if block ~ ~ ~ jukebox{RecordItem:{tag:{RootJunction:1b}}} run function dynagen_creator:process_root_junction

#decrement the index and move marker to next position
scoreboard players remove #xIndex DGCvar 1
tp @s ~1 ~ ~

#move back to start of next row when done with the current one
execute if score #xIndex DGCvar matches 0 positioned as @s run function dynagen_creator:next_row
execute if score #yIndex DGCvar matches 0 positioned as @s run function dynagen_creator:next_slice

#recursive loop
execute if score #zIndex DGCvar matches 1.. positioned as @s run function dynagen_creator:scan

#finish Junction processing since Master Lists have been completed
execute if block ~ ~ ~ barrel{CustomName:'{"text":"Root Junction Block"}'} run function dynagen_creator:convert_to_root_junction
execute if block ~ ~ ~ jukebox{RecordItem:{tag:{Junction:1b}}} run function dynagen_creator:convert_to_junction
