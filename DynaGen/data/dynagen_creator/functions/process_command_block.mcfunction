data modify storage dynagen_creator: CommandTemp set from block ~ ~ ~ Command
setblock ~ ~ ~ command_block{TrackOutput:0b,auto:1b,UpdateLastExecution:0b}
data modify block ~ ~ ~ Command set from storage dynagen_creator: CommandTemp