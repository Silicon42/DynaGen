#handles chunk popluation when a stepper finds a chunk to be processed
#this occurs after having traversed all new chunks in the shell that the stepper can reach
# as execution returns back up the execution stack and must not occur on the way down the stack
# doing so prevents runaway chunk loading

#sets up a new chunk load detector
#less safe to do this before the population step as population has a chance of replacing it, but more efficient
setblock ~ 0 ~ command_block{auto:1b,Command:"function dynagen:spread_attempt"}
data modify storage dynagen: temp set from block ~ 0 ~
execute store result score #xChunk DGvar run data get storage dynagen: temp.x .0625
execute store result score #zChunk DGvar run data get storage dynagen: temp.z .0625

#calls any external modifications that other pack creators want to make
scoreboard players set #seedCalcdBool DGvar 0
function #dynagen:chunk_pop