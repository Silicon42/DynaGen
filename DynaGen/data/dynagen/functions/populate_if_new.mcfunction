#moves the execution location in the pattern shown below to check that the 7*7 area of chunks centered on the starting location have been populated, and if not does so

#  X+ -->
#Z+
#|	43 >44 >45 >46 >47 >48 >49
#v	 ^
#	42  21 >22 >23 >24 >25 >26
#	 ^   ^                   v
#	41  20  07 >08 >09 >10  27
#	 ^   ^   ^           v   v
#	40  19  06  01 >02  11  28
#	 ^   ^   ^       v   v   v
#	39  18  05< 04< 03  12  29
#	 ^   ^               v   v
#	38  17< 16< 15< 14< 13  30
#	 ^                       v
#	37< 36< 35< 34< 33< 32< 31

#inner 5*5, does not need chunk load detectors
# 01
execute if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>02
scoreboard players add #xChunk DGvar 1
execute positioned ~16 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#v03
scoreboard players add #zChunk DGvar 1
execute positioned ~16 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<04
scoreboard players remove #xChunk DGvar 1
execute positioned ~ 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<05
scoreboard players remove #xChunk DGvar 1
execute positioned ~-16 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^06
scoreboard players remove #zChunk DGvar 1
execute positioned ~-16 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^07
scoreboard players remove #zChunk DGvar 1
execute positioned ~-16 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>08
scoreboard players add #xChunk DGvar 1
execute positioned ~ 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>09
scoreboard players add #xChunk DGvar 1
execute positioned ~16 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>10
scoreboard players add #xChunk DGvar 1
execute positioned ~32 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#v11
scoreboard players add #zChunk DGvar 1
execute positioned ~32 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#v12
scoreboard players add #zChunk DGvar 1
execute positioned ~32 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#v13
scoreboard players add #zChunk DGvar 1
execute positioned ~32 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<14
scoreboard players remove #xChunk DGvar 1
execute positioned ~16 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<15
scoreboard players remove #xChunk DGvar 1
execute positioned ~ 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<16
scoreboard players remove #xChunk DGvar 1
execute positioned ~-16 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#<17
scoreboard players remove #xChunk DGvar 1
execute positioned ~-32 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^18
scoreboard players remove #zChunk DGvar 1
execute positioned ~-32 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^19
scoreboard players remove #zChunk DGvar 1
execute positioned ~-32 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^20
scoreboard players remove #zChunk DGvar 1
execute positioned ~-32 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#^21
scoreboard players remove #zChunk DGvar 1
execute positioned ~-32 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>22
scoreboard players add #xChunk DGvar 1
execute positioned ~-16 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>23
scoreboard players add #xChunk DGvar 1
execute positioned ~ 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>24
scoreboard players add #xChunk DGvar 1
execute positioned ~16 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#>25
scoreboard players add #xChunk DGvar 1
execute positioned ~32 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_no_detector
#outer loop, potentially needs load detectors
#>26
scoreboard players add #xChunk DGvar 1
execute positioned ~48 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#v27
scoreboard players add #zChunk DGvar 1
execute positioned ~48 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#v28
scoreboard players add #zChunk DGvar 1
execute positioned ~48 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#v29
scoreboard players add #zChunk DGvar 1
execute positioned ~48 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#v30
scoreboard players add #zChunk DGvar 1
execute positioned ~48 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#v31
scoreboard players add #zChunk DGvar 1
execute positioned ~48 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<32
scoreboard players remove #xChunk DGvar 1
execute positioned ~32 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<33
scoreboard players remove #xChunk DGvar 1
execute positioned ~16 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<34
scoreboard players remove #xChunk DGvar 1
execute positioned ~ 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<35
scoreboard players remove #xChunk DGvar 1
execute positioned ~-16 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<36
scoreboard players remove #xChunk DGvar 1
execute positioned ~-32 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#<37
scoreboard players remove #xChunk DGvar 1
execute positioned ~-48 0 ~48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^38
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^39
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^40
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~ if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^41
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~-16 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^42
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~-32 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#^43
scoreboard players remove #zChunk DGvar 1
execute positioned ~-48 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>44
scoreboard players add #xChunk DGvar 1
execute positioned ~-32 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>45
scoreboard players add #xChunk DGvar 1
execute positioned ~-16 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>46
scoreboard players add #xChunk DGvar 1
execute positioned ~ 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>47
scoreboard players add #xChunk DGvar 1
execute positioned ~16 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>48
scoreboard players add #xChunk DGvar 1
execute positioned ~32 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector
#>49
scoreboard players add #xChunk DGvar 1
execute positioned ~48 0 ~-48 if block ~ 0 ~ minecraft:bedrock run function dynagen:pop_chunk_w_detector