#reads a 16 bit scoreboard value as the y, x, and z position in a chunk where y is on the most significant bits, and moves a marker entity there via teleport commands

#INPUT: #chunkIndex DGvar (16 bit value stored in the lower), requires marker entity be placed at suitable starting position (typically in-chunk position 0 0 0, but may be higher if less than the full range is necessary), does not protect input!

#y-coord
execute if score #chunkIndex DGvar matches 32768.. positioned as @s run tp ~ ~128 ~
scoreboard players operation #chunkIndex DGvar %= 32768 const
execute if score #chunkIndex DGvar matches 16384.. positioned as @s run tp ~ ~64 ~
scoreboard players operation #chunkIndex DGvar %= 16384 const
execute if score #chunkIndex DGvar matches 8192.. positioned as @s run tp ~ ~32 ~
scoreboard players operation #chunkIndex DGvar %= 8192 const
execute if score #chunkIndex DGvar matches 4096.. positioned as @s run tp ~ ~16 ~
scoreboard players operation #chunkIndex DGvar %= 4096 const
execute if score #chunkIndex DGvar matches 2048.. positioned as @s run tp ~ ~8 ~
scoreboard players operation #chunkIndex DGvar %= 2048 const
execute if score #chunkIndex DGvar matches 1024.. positioned as @s run tp ~ ~4 ~
scoreboard players operation #chunkIndex DGvar %= 1024 const
execute if score #chunkIndex DGvar matches 512.. positioned as @s run tp ~ ~2 ~
scoreboard players operation #chunkIndex DGvar %= 512 const
execute if score #chunkIndex DGvar matches 256.. positioned as @s run tp ~ ~1 ~
scoreboard players operation #chunkIndex DGvar %= 256 const
#x-coord
execute if score #chunkIndex DGvar matches 128.. positioned as @s run tp ~8 ~ ~
scoreboard players operation #chunkIndex DGvar %= 128 const
execute if score #chunkIndex DGvar matches 64.. positioned as @s run tp ~4 ~ ~
scoreboard players operation #chunkIndex DGvar %= 64 const
execute if score #chunkIndex DGvar matches 32.. positioned as @s run tp ~2 ~ ~
scoreboard players operation #chunkIndex DGvar %= 32 const
execute if score #chunkIndex DGvar matches 16.. positioned as @s run tp ~1 ~ ~
scoreboard players operation #chunkIndex DGvar %= 16 const
#z-coord
execute if score #chunkIndex DGvar matches 8.. positioned as @s run tp ~ ~ ~8
scoreboard players operation #chunkIndex DGvar %= 8 const
execute if score #chunkIndex DGvar matches 4.. positioned as @s run tp ~ ~ ~4
scoreboard players operation #chunkIndex DGvar %= 4 const
execute if score #chunkIndex DGvar matches 2.. positioned as @s run tp ~ ~ ~2
scoreboard players operation #chunkIndex DGvar %= 2 const
execute if score #chunkIndex DGvar matches 1.. positioned as @s run tp ~ ~ ~1
