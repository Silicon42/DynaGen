#checks that if the block the item frame was placed on was a structure block in SAVE mode, and if so starts a scan
#    also kills the entity and revokes the advancement

#need AEC because item frames can't be moved by merging their Pos tags post 1.16 and I don't want to switch it all over to tile tags
summon minecraft:area_effect_cloud ~ ~ ~ {Particle:"block air",Tags:["DynagenScanMarker"]}
tp @e[type=area_effect_cloud,tag=DynagenScanMarker] @e[type=item_frame,tag=DynagenSaveTool,limit=1,sort=nearest]
kill @e[type=item_frame,distance=..5.75,tag=DynagenSaveTool,limit=1,sort=nearest]

execute as @e[type=area_effect_cloud,distance=..5.75,tag=DynagenScanMarker,limit=1,sort=nearest] at @s if block ^ ^ ^-1 structure_block{mode:"SAVE"} run function dynagen_creator:start_scan
execute as @e[type=area_effect_cloud,distance=..5.75,tag=DynagenScanMarker,limit=1,sort=nearest] at @s if block ^ ^ ^-1 jukebox{RecordItem:{tag:{Junction:1b}}} run function dynagen_creator:get_load_offsets
#execute as @e[type=area_effect_cloud,distance=..5.75,tag=DynagenScanMarker,limit=1,sort=nearest] at @s if block ^ ^ ^-1 barrel{CustomName:'{"text":"Root Junction Block"}'} run function dynagen_creator:get_load_offsets
kill @e[type=area_effect_cloud,distance=..5.75,tag=DynagenScanMarker,limit=1,sort=nearest]
advancement revoke @s only dynagen_creator:used_save_tool