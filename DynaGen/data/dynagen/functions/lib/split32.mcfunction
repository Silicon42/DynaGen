#splits a 32-bit scoreboard value passed in on "#split32Lo DGvar" into 2 16-bit values stored in the lower 16 bits with zeroed out upper bits

#NOTE: this function is broken for some reason, haven't had time to fix it since it isn't currently used

scoreboard players operation #split32Hi DGvar = #split32Lo DGvar
scoreboard players operation #split32Lo DGvar %= 65536 const
scoreboard players operation #split32Hi DGvar -= #split32Lo DGvar
scoreboard players operation #split32Hi DGvar /= 65536 const
scoreboard players operation #split32Hi DGvar %= 65536 const
