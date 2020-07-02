scoreboard players operation #temp2 DGvar = #lcgSeed DGvar
scoreboard players operation #temp2 DGvar %= 65536 const
scoreboard players operation #temp2 DGvar /= 16 const

scoreboard players operation #temp DGvar = #lcgSeed DGvar
scoreboard players operation #temp DGvar %= 16 const
scoreboard players operation #temp DGvar += #tempX DGvar
execute store result storage dynagen: PosTemp[0] double 1 run scoreboard players get #temp DGvar

scoreboard players operation #temp DGvar = #temp2 DGvar
scoreboard players operation #temp2 DGvar /= 16 const

scoreboard players operation #temp DGvar = #lcgSeed DGvar
scoreboard players operation #temp DGvar %= 16 const
scoreboard players operation #temp DGvar += #tempZ DGvar
execute store result storage dynagen: PosTemp[2] double 1 run scoreboard players get #temp DGvar

scoreboard players operation #temp DGvar = #lcgSeed DGvar
execute store result storage dynagen: PosTemp[1] double 1 run scoreboard players get #temp2 DGvar

data modify entity @s Pos set from storage dynagen: PosTemp