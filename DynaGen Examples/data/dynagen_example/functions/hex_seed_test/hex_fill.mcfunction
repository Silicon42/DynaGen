#turns a single hex value into a color
scoreboard players operation #hexDigit DGvar = #chunkSeed DGvar 
scoreboard players operation #hexDigit DGvar %= 16 const
scoreboard players operation #chunkSeed DGvar -= #hexDigit DGvar
scoreboard players operation #chunkSeed DGvar /= 16 const

function dynagen_example:hex_seed_test/tree_0-15