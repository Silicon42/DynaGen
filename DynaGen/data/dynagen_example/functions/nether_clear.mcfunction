#clears all but the bottom bedrock in the nether
#large fill commands can be insanely laggy, don't enable with more than minimum render distance
execute if predicate minecraft:dimension/the_nether run fill ~-8 1 ~-8 ~7 128 ~7 air