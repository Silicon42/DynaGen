#handles one step of following a rectangular layout of command blocks clockwise and applies terrain modifications

#remove the detector we just left since its job is done.
setblock ^ ^ ^-16 barrier

#if we are currently at a command block and there is bedrock 1 chunk forward and to the left, move the execution point forward and call another stepper iteration
execute if block ~ 0 ~ command_block if block ^16 ^ ^16 bedrock positioned ^ ^ ^16 run function dynagen:cw_stepper
#else if there is bedrock instead, call the turn function as this is a corner in the command block track
execute if block ~ 0 ~ bedrock run function dynagen:cw_turn
#else do nothing as we've processed all we can

#applies terrain modifications as execution returns back up the stack
#also places new command block detectors
execute positioned ^16 ^ ^ run function dynagen:populate_chunk