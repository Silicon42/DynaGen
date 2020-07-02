#turns a single hex value into a color
scoreboard players operation #hexDigit DGvar = #chunkSeed DGvar 
scoreboard players operation #hexDigit DGvar %= 16 const

function dynagen_utils:tiny_hex_test/tree_0-15