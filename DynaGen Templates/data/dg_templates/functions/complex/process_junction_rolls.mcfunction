# Recursively processes rounds of Junction rolls
#INPUT: #rollDepth DGvar (determines the max number of rounds deep that structure generation will attempt to go)

# get the length of the Junction List so we know how long to loop for
execute store result score #rollIndex DGvar run data get storage dynagen: JunctionList
function dg_templates:complex/process_junction

#decrement and call next iteration if applicable
scoreboard players remove #rollDepth DGvar 1
execute if score #rollDepth DGvar matches 1.. run function dg_templates:complex/process_junction_rolls