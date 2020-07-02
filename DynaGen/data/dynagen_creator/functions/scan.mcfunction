# Scans the area that the targeted structure block is set to by looping recursively

#process special blocks
execute if block ~ ~ ~ #dynagen_creator:loot_containers if data block ~ ~ ~ LootTable run data modify storage dynagen_creator: MasterLootList append from entity @s Pos
execute if block ~ ~ ~ minecraft:jigsaw run function dynagen_creator:process_junction
#NOTE: does not preserve facing direction, do not use to start a chain unless you are not using rotation/mirroring
execute if block ~ ~ ~ minecraft:chain_command_block{CustomName:'{"text":"Convert to Auto"}'} run function dynagen_creator:process_command_block

#decrement the index and move marker to next position
scoreboard players remove #xIndex DGCvar 1
tp @s ~1 ~ ~

#move back to start of next row when done with the current one
execute if score #xIndex DGCvar matches 0 positioned as @s run function dynagen_creator:next_row
execute if score #yIndex DGCvar matches 0 positioned as @s run function dynagen_creator:next_slice

#recursive loop
execute if score #zIndex DGCvar matches 1.. positioned as @s run function dynagen_creator:scan

#finish Junction processing since Master Lists have been completed
execute if block ~ ~ ~ minecraft:jigsaw run function dynagen_creator:convert_to_junction
execute if block ~ ~ ~ minecraft:jukebox{RecordItem:{tag:{RootJunction:1b}}} run function dynagen_creator:convert_to_root_junction