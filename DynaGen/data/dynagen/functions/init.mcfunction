#clean up any old variables
scoreboard objectives remove DGvar
#initializes scoreboards needed to work
scoreboard objectives add DGvar dummy
scoreboard objectives add const dummy

#setting this to 1 will enable transfering dimensions and other warps to new areas to start terrain modifications in the new area, as well as manual seeding of new areas
# should only be enabled once you are done protecting areas that you wish to remain unmodified
# setting this back to 0 will only stop warp based spreading NOT load detector based spreading
# is normally set when enable_terrain_mods.mcfunction is run
scoreboard players set #dgEnabled DGvar 0

#custom generation in the End is currently WIP, but not yet ready
scoreboard players set #endEnabled DGvar 0

#2^16
scoreboard players set 65536 const 65536
#2^15
scoreboard players set 32768 const 32768
#2^14
scoreboard players set 16384 const 16384
#2^13
scoreboard players set 8192 const 8192
#2^12
scoreboard players set 4096 const 4096
#2^11
scoreboard players set 2048 const 2048
#2^10
scoreboard players set 1024 const 1024
#2^9
scoreboard players set 512 const 512
#2^8
scoreboard players set 256 const 256
#2^7
scoreboard players set 128 const 128
#2^6
scoreboard players set 64 const 64
#2^5
scoreboard players set 32 const 32
#2^4
scoreboard players set 16 const 16
#2^3
scoreboard players set 8 const 8
#2^2
scoreboard players set 4 const 4
#2^1
scoreboard players set 2 const 2

#(golden ratio) = (1 + sqrt(5)) / 2
#1640531526.5027697035224152292074 = 2^32 * (1 - (golden ratio)^-1)
scoreboard players set 1640531527 const 1640531527
#25032.524513286891228064197223014 = 2^16 * (1 - (golden ratio)^-1)
scoreboard players set 25033 const 25033
scoreboard players set -25033 const -25033

#closest suitable multiplier for LCG to 1640531527
scoreboard players set 1640531525 const 1640531525

#note that a real Minecraft seed is a long, but storing it reads it as and int and loses the remaining bits
execute store result score #seedLo DGvar run seed
#split the 32-bit value into 2 16-bit values in the lower halves for easier processing later
scoreboard players operation #seedHi DGvar = #seedLo DGvar
scoreboard players operation #seedLo DGvar %= 65536 const
scoreboard players operation #seedHi DGvar -= #seedLo DGvar
scoreboard players operation #seedHi DGvar /= 65536 const
scoreboard players operation #seedHi DGvar %= 65536 const

#initialize storage locations so they can be written
data merge storage dynagen: {PosTemp:[0d,0d,0d]}

execute store result score #temp DGvar run gamerule maxCommandChainLength
execute if score #temp DGvar matches ..131071 run gamerule maxCommandChainLength 131072