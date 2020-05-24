#this is called by command block detectors that are placed at the edge of newly generated terrain
#the command blocks are set to "auto:1b",
#but due to the way that Minecraft handles loaded chunks, the outer most chunks aren't ticked,
#so the command blocks won't activate until the player moves towards them, thus detecting new terrain generation

#this function itself detects if there is a diagonally adjacent chunk that hasn't been processed and rotates the command context appropriately
#this is necessary since the detectors don't know which side of them the unprocessed terrain may be on if there is even any at all

#if else-if that looks for and executes from only 1 diagonally adjacent chunk that has not been processed yet
#note that this is run from a command block, so a fake player must be used instead of @s
#this is checked in the order of -+, +-, --, ++ to reduce the number of checks typically run
scoreboard players set #dgElif DGvar 0
execute if block ~-16 0 ~16 minecraft:bedrock store success score #dgElif DGvar run function dynagen:start_stepper
execute if score #dgElif DGvar matches 0 if block ~16 0 ~-16 minecraft:bedrock rotated 180 0 store success score #dgElif DGvar run function dynagen:start_stepper
execute if score #dgElif DGvar matches 0 if block ~-16 0 ~-16 minecraft:bedrock rotated 90 0 store success score #dgElif DGvar run function dynagen:start_stepper
execute if score #dgElif DGvar matches 0 if block ~16 0 ~16 minecraft:bedrock rotated 270 0 store success score #dgElif DGvar run function dynagen:start_stepper
#else none found, remove detector
execute if score #dgElif DGvar matches 0 run setblock ~ ~ ~ barrier