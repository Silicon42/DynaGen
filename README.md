# DynaGen
Official Repository: https://github.com/Silicon42/DynaGen

DynaGen is a datapack that modifies terrain Dynamically on the fly while Minecraft Generates terrain. The purpose of this pack is to provide a unified way for other datapack creators to easily add their structures or terrain customizations without having to recreate the logic needed to place them in the world. This helps to lower the barrier to entry on world customizing datapacks and cuts down on the processing overhead required to do so. DynaGen is designed for efficiency and ease of use first. Rather than pre-generate tons of terrain, inflating save sizes, to place in custom structures, DynaGen can calculate values from the world seed and chunk coordinates to determine when and how to spawn structures while the player explores their world (although it is planned to add a pre-generator for those who prefer lower CPU usage). This allows the customizations to be totally seamless and ensures that structures spawn in the same location and way every time the same world seed is entered. Nearly all modifications happen before players can even see them. It's multiplayer safe, supports all render distances, and even supports changing of the render distance. In addition DynaGen attempts to do so more efficiently than any prior structure placing packs do, causing zero passive lag and attempting to be as efficent as possible by using 0 marker entities and as few NBT operations as possible when new chunks load.

# Usage

To start the pack's terrain modification feature, simply copy the zip file to your world's datapack folder, load up your world (currently only configured for superflat worlds with only 1 layer of bedrock at Y=0), and type the command </function dynagen:enable_terrain_modifications>

For pack creators wishing to utilize DynaGen, simply create a datapack containing the modifications you want to occur and structures you want to generate at a chunk level and register it under the dynagen:chunk_pop function tag so DynaGen can call it. DynaGen currently supports structures of up to 5x5 chunks centered on the triggering chunk however, the placement of structures exceeding 3x3 chunks will be visible to the player and may be extremely close to them in the case of render distance 2-3. Structures and modifications that touch chunk borders may cause additional temporary chunk loading due to block updates, which one should attempt to limit as it increases CPU usage. Attempting to generate structures that extend out of a 5x5 chunk area may put the player at risk of suffocating in a wall, falling into generated voids, and other hazards. If your structure/modifications could potentially modify blocks at layer 0, you must make sure to call dynagen:height_check with the appropriate height value as modifying blocks at y=0 may break the system. You should not modify anything in the "dynagen" namespace to ensure compatibility with other datapacks. You should not teleport the marker entity that is executing the commands as this may break the system since it relies on the alignment to determine if chunks have been processed or not. Scoreboard values defined in this datapack are to be considered read only unless otherwise explicitly stated.

# Current Features

- chunk loading based spreading
- efficient functions
- dimension predicates
- advancement based dimensional transfer detection
- centralized chunk seed calculation

# Planned features:

- keep out regions (to prevent structures from attempting to spawn in defined areas)
- templates for easy sub-module creation
- ~~centralized chunk seed calculations~~ (completed!)
- region based structure spawning and support for larger sprawling structures
- surface structure placement
- surface following paths, with stair and slab support
- centalized biome detection(WIP)
- structure connections like jigsaw blocks do
- randomized structure rotation, mirroring, and pools
- support for the End
- support for custom Dimensions
- other suggestions from users once the important core features are done

# Remarks

Note that currently this pack is in the alpha stage, and thus many things in it are subject to change or are incomplete. It currently comes with several example functions, some of which are pre-installed, that are designed to work with a super flat world with only a layer of bedrock at layer 0, but these will be split off into their own example packs in a future release. There are a lot of predicates to add as well as features that need to be more thouroughly tested and the folder structure is very much subject to change at the moment. At the moment I'm putting this out there to generate a bit of interest and see if anyone can spot any bugs/quirks that I missed. I put several days of work into getting the chunk seed calculation to not have any visible patterns, so hopefully that worked out well enough. Feel free to take a look through my pack and tell me what you think or ask me questions. Hopefully I commented things well enough that most of it is understandable. (social media links to be added soon)

# Contacts and Links

[Reddit](https://old.reddit.com/user/Silicon42/)

[Youtube](https://www.youtube.com/channel/UCRyzxobRKZqlDjKd4fByT8A/)

[Minecraft Forum](https://www.minecraftforum.net/members/Silicon42)


# Donatations

Appreciate this project? Want to support me? Feel free to buy me a Coffee: https://ko-fi.com/silicon42
Even the smallest amount helps!