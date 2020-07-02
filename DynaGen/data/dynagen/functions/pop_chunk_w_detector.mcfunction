#handles chunk popluation when in the cental 7*7 outer ring of a completely new area

#calls any external modifications that other pack creators want to make
scoreboard players set #chunkSeedCalcd DGvar 0
function #dynagen:chunk_pop

#sets up a new chunk load detector
setblock ~ 0 ~ command_block{auto:1b,Command:"function dynagen:spread_attempt"}