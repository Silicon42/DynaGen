#kill the marker entity to take it off the @e list
kill

#forces the marker's x and z coords to the corner of the chunk since execute store casts to int before scaling
execute store result entity @s Pos[0] double 16 run data get entity @s Pos[0] .0625
execute store result entity @s Pos[2] double 16 run data get entity @s Pos[2] .0625

#fill with the masking block first to reduce block and geometry updates, however this means it uses more commands
execute positioned as @s run function dynagen_utils:mask_hex/mask_base

#select which hex value of the 8 to look at
scoreboard players operation #hexMask DGvar %= 8 const
execute if score #hexMask DGvar matches ..3 positioned as @s run tp ~ 0 ~8
scoreboard players operation #hexMask DGvar %= 4 const
execute if score #hexMask DGvar matches ..1 positioned as @s run tp ~8 0 ~
scoreboard players operation #hexMask DGvar %= 2 const
execute if score #hexMask DGvar matches 0 positioned as @s run tp ~4 0 ~

scoreboard players set #indexI DGvar 64
scoreboard players set #indexJ DGvar 64
execute positioned as @s positioned ~-512 0 ~-512 run function dynagen_utils:mask_hex/row