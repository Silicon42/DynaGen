#displays the lowest 4 bits of each coord instead of seed, used to check that the coordinates are being tracked correctly
fill ~-8 1 ~-8 ~7 1 ~7 stone

scoreboard players operation #hexDigit DGvar = #xChunk DGvar
scoreboard players operation #hexDigit DGvar %= 16 const
execute positioned ~ 1 ~-8 run function dynagen_example:hex_seed_test/tree_0-15
clone ~ 1 ~-8 ~3 1 ~-1 ~4 1 ~-8

scoreboard players operation #hexDigit DGvar = #zChunk DGvar
scoreboard players operation #hexDigit DGvar %= 16 const
execute positioned ~-8 1 ~ run function dynagen_example:hex_seed_test/tree_0-15
clone ~-8 1 ~ ~-5 1 ~7 ~-4 1 ~
