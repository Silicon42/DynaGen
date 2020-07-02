# If you want your structures to be biome specific, register a function like this to #dynagen:chunk_pop which calls your population attempt
# this example won't place the structure in oceans or rivers
execute unless predicate dynagen:biome_categorical/water_biomes run function dg_templates:structure_pop