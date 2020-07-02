#first part here is to handle negative values correctly
#shift down by 1 hex digit
scoreboard players operation #hexDigit DGvar = #chunkSeed DGvar 
scoreboard players operation #hexDigit DGvar %= 16 const
scoreboard players operation #chunkSeed DGvar -= #hexDigit DGvar
scoreboard players operation #chunkSeed DGvar /= 16 const
#zero out sign extension
execute if score #chunkSeed DGvar matches ..-1 run scoreboard players add #chunkSeed DGvar 268435456

scoreboard players remove digitSel DGvar 1
execute if score digitSel DGvar matches 4.. run scoreboard players operation #chunkSeed DGvar /= 65536 const
execute if score digitSel DGvar matches 2.. run scoreboard players operation #chunkSeed DGvar /= 256 const
execute if score digitSel DGvar matches 1.. run scoreboard players operation #chunkSeed DGvar /= 16 const