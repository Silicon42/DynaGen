#basic Linear Congruential Generator, used for seeding loot chests or structure integrity

#NOTE: These LCG values are not tested!, they were picked according to guidelines on Wikipedia
scoreboard players operation #lcgSeed DGvar *= 1640531525 const
scoreboard players add #lcgSeed DGvar 1
