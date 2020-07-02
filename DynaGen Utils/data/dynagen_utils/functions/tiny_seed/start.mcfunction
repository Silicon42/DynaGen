#simulates chunk seed calculations on a block scale to reduce render distance and speed up seed testing/mapping
# processes a 128*128 block region aligned to a scale 0 (fully zoomed in) map
# it does not use terrain spreading, instead it does each block recursively and limits itself to 1 row per tick
# useful to pack makers for testing rates of structure placement quickly w/o having to generate tons of terrain
#IMPORTANT: this is for debug purposes only, it is not safe to use more than one instance at a time
#expects the player to be loading the full 128*128 block region of the map or else it will break when the marker hits non entity processing chunks
# ie render distance 10+ without moving much from the spot that they are teleported to at the start until it's finished
tag @s add tiny_seed_user
summon area_effect_cloud ~64 ~ ~64 {Particle:"block air",WaitTime:127,Tags: ["tiny_seed_marker"]}
execute as @e[tag=tiny_seed_marker] run function dynagen_utils:tiny_seed/align
