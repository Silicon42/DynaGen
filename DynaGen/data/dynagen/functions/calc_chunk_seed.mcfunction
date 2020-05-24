
#Fibonacci-blender edition
#calculates the chunk seed from the x and z chunk coords and the world seed

#the lower 16 bits of the chunk coords are most useful since they change the fastest and the result needs to be packed into a 32 bit int
#however if only the lower bits were used, there would be a repeat every 2^16 chunks, thus the upper halves are kept for later

#this breaks both 32-bit values into 2 16-bit blocks each, each in the lower 16 bits
#it doesn't matter if the hi bits get sign extended since there is a %= operation later
scoreboard players operation #seedCalcLoX DGvar = #xChunk DGvar
scoreboard players operation #seedCalcHiX DGvar = #xChunk DGvar

scoreboard players operation #seedCalcLoZ DGvar = #zChunk DGvar
scoreboard players operation #seedCalcHiZ DGvar = #zChunk DGvar

#prevent flooring from changing the bit pattern when shifting down negative numbers by rounding down early
execute if score #seedCalcHiX DGvar matches ..-1 run scoreboard players remove #seedCalcHiX DGvar 65535
scoreboard players operation #seedCalcHiX DGvar /= 65536 const

execute if score #seedCalcHiZ DGvar matches ..-1 run scoreboard players remove #seedCalcHiZ DGvar 65535
scoreboard players operation #seedCalcHiZ DGvar /= 65536 const

#pre-hash with Fibonacci hash to spread nearby values apart
# values are opposite sign to break top/bottom mirror symmetry across the diagonal
scoreboard players operation #seedCalcLoX DGvar *= 25033 const
scoreboard players operation #seedCalcLoZ DGvar *= -25033 const

#add in the world seed to make each world unique
scoreboard players operation #seedCalcLoX DGvar += #seedHi DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedLo DGvar

#add in the hi bits to prevent repetition, swapped to cause further mixing
scoreboard players operation #seedCalcLoX DGvar += #seedCalcHiZ DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedCalcHiX DGvar

#constrain the values to 16-bit values
scoreboard players operation #seedCalcLoX DGvar %= 65536 const
scoreboard players operation #seedCalcLoZ DGvar %= 65536 const

#arbitrary, non-interger place rotation of positive value "x" by "p" places of a "d" digit wide field of base "B" via floating point math:
# ( floor( x*( B^p + B^(p-d) ) ) ) % B^d
#in this case B=2, d=13, x=input, and p=d*(3 - golden ratio)
# meaning the whole thing can be expressed as a single floating point multiply: x * 255991.12096312665
# 13 bits are used because that's the max that will fit without an overflow

scoreboard players operation #seedCalcHiX DGvar = #seedCalcLoX DGvar
scoreboard players operation #seedCalcLoX DGvar %= 8192 const
scoreboard players operation #seedCalcHiX DGvar -= #seedCalcLoX DGvar

scoreboard players operation #seedCalcHiZ DGvar = #seedCalcLoZ DGvar
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const
scoreboard players operation #seedCalcHiZ DGvar -= #seedCalcLoZ DGvar

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoX DGvar
execute store result score #seedCalcLoX DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoX DGvar %= 8192 const

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoZ DGvar
execute store result score #seedCalcLoZ DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const

#cut the pieces into 8-bit sections and rearrange for a 2nd Fibonacci rotation offset by 8 bits
#this ensures x and y each affect both halves of the value instead of just the upper and lower bits respectively
scoreboard players operation #seedCalcHiX DGvar += #seedCalcLoX DGvar
scoreboard players operation #seedCalcHiX DGvar /= 256 const
scoreboard players operation #seedCalcLoX DGvar *= 256 const

scoreboard players operation #seedCalcHiZ DGvar += #seedCalcLoZ DGvar
scoreboard players operation #seedCalcHiZ DGvar /= 256 const
scoreboard players operation #seedCalcLoZ DGvar *= 256 const

scoreboard players operation #seedCalcLoX DGvar += #seedCalcHiZ DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedCalcHiX DGvar

scoreboard players operation #seedCalcLoX DGvar %= 65536 const
scoreboard players operation #seedCalcLoZ DGvar %= 65536 const

scoreboard players operation #seedCalcHiX DGvar = #seedCalcLoX DGvar
scoreboard players operation #seedCalcLoX DGvar %= 8192 const
scoreboard players operation #seedCalcHiX DGvar -= #seedCalcLoX DGvar

scoreboard players operation #seedCalcHiZ DGvar = #seedCalcLoZ DGvar
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const
scoreboard players operation #seedCalcHiZ DGvar -= #seedCalcLoZ DGvar

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoX DGvar
execute store result score #seedCalcLoX DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoX DGvar %= 8192 const

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoZ DGvar
execute store result score #seedCalcLoZ DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const

#3rd round of Fibonacci rotation with both halves rotated by 4 bits to help mix x and z values onto each other
#this helps make them both have an affect on the same bits in conjunction w/ the 4th round
scoreboard players operation #seedCalcHiX DGvar += #seedCalcLoX DGvar
scoreboard players operation #seedCalcHiX DGvar /= 4096 const
scoreboard players operation #seedCalcLoX DGvar *= 16 const

scoreboard players operation #seedCalcHiZ DGvar += #seedCalcLoZ DGvar
scoreboard players operation #seedCalcHiZ DGvar /= 4096 const
scoreboard players operation #seedCalcLoZ DGvar *= 16 const

scoreboard players operation #seedCalcLoX DGvar += #seedCalcHiX DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedCalcHiZ DGvar

scoreboard players operation #seedCalcLoX DGvar %= 65536 const
scoreboard players operation #seedCalcLoZ DGvar %= 65536 const

scoreboard players operation #seedCalcHiX DGvar = #seedCalcLoX DGvar
scoreboard players operation #seedCalcLoX DGvar %= 8192 const
scoreboard players operation #seedCalcHiX DGvar -= #seedCalcLoX DGvar

scoreboard players operation #seedCalcHiZ DGvar = #seedCalcLoZ DGvar
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const
scoreboard players operation #seedCalcHiZ DGvar -= #seedCalcLoZ DGvar

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoX DGvar
execute store result score #seedCalcLoX DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoX DGvar %= 8192 const

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoZ DGvar
execute store result score #seedCalcLoZ DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const

#4th round of Fibonacci rotation, w/ 4 bits off the top of each half transfered to be bottom of the opposite half
#this helps make them both have an affect on the same bits in conjunction w/ the 3rd round
scoreboard players operation #seedCalcHiX DGvar += #seedCalcLoX DGvar
scoreboard players operation #seedCalcHiX DGvar /= 4096 const
scoreboard players operation #seedCalcLoX DGvar *= 16 const

scoreboard players operation #seedCalcHiZ DGvar += #seedCalcLoZ DGvar
scoreboard players operation #seedCalcHiZ DGvar /= 4096 const
scoreboard players operation #seedCalcLoZ DGvar *= 16 const

scoreboard players operation #seedCalcLoX DGvar += #seedCalcHiZ DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedCalcHiX DGvar

scoreboard players operation #seedCalcLoX DGvar %= 65536 const
scoreboard players operation #seedCalcLoZ DGvar %= 65536 const

scoreboard players operation #seedCalcHiX DGvar = #seedCalcLoX DGvar
scoreboard players operation #seedCalcLoX DGvar %= 8192 const
scoreboard players operation #seedCalcHiX DGvar -= #seedCalcLoX DGvar

scoreboard players operation #seedCalcHiZ DGvar = #seedCalcLoZ DGvar
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const
scoreboard players operation #seedCalcHiZ DGvar -= #seedCalcLoZ DGvar

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoX DGvar
execute store result score #seedCalcLoX DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoX DGvar %= 8192 const

execute store result storage dynagen: seedCalc double 255991.12096312665 run scoreboard players get #seedCalcLoZ DGvar
execute store result score #seedCalcLoZ DGvar run data get storage dynagen: seedCalc
scoreboard players operation #seedCalcLoZ DGvar %= 8192 const

#put the pieces back together for get_pack_chunk_seed
scoreboard players operation #seedCalcLoX DGvar += #seedCalcHiX DGvar
scoreboard players operation #seedCalcLoZ DGvar += #seedCalcHiZ DGvar
scoreboard players operation #seedCalcLoX DGvar *= 65536 const
scoreboard players operation #seedCalcLoX DGvar += #seedCalcLoZ DGvar