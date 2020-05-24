#can only display 1 hex digit, but you can select which w/ digitSel DGvar
scoreboard players set #packSalt DGvar 0
function dynagen:lib/get_core_chunk_seed

scoreboard players operation digitSel DGvar %= 8 const
execute unless score digitSel DGvar matches 0 run function dynagen_utils:tiny_hex_test/downshift
function dynagen_utils:tiny_hex_test/hex_setb