#handles when the execution comes to a counter-clockwise turn in the command block track
execute if block ^16 ^ ^ bedrock rotated ~-90 0 positioned ^16 ^ ^16 run function dynagen:ccw_stepper

#applies terrain modifications as execution returns back up the stack
#also places new command block detectors
function dynagen:populate_chunk