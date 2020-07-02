#kicks off handling for anytime that a player can potentially enter an area without having activated any load detectors that would be able to spread into it, such as traveling between dimensions
#expects bedrock at layer 0
#NOTE: must be called explicitly if your pack has any method of teleporting players to unexplored chunks

#summons marker entity to run from
execute if score #dgEnabled DGvar matches 1 run summon area_effect_cloud ~ ~ ~ {Particle:"block air",Tags: ["dynagen_marker"]}
execute as @e[distance=0,type=area_effect_cloud,tag=dynagen_marker] run function dynagen:align_marker
