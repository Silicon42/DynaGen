#handles chunk popluation when in the cental 5*5 chunk region of a completely new area

#calls any external modifications that other pack creators want to make
scoreboard players set #chunkSeedCalcd DGvar 0
function #dynagen:chunk_pop

#mark the chunk as populated
setblock ~ 0 ~ barrier