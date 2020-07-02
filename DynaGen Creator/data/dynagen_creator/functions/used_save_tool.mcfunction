#checks that if the block the item frame was placed on was a structure block in SAVE mode, and if so starts a scan
#    also kills the entity and revokes the advancement

execute as @e[type=item_frame,distance=..5.75,tag=DynagenSaveTool,limit=1,sort=nearest] at @s if block ^ ^ ^-1 structure_block{mode:"SAVE"} run function dynagen_creator:start_scan
kill @e[type=item_frame,distance=..5.75,tag=DynagenSaveTool,limit=1,sort=nearest]
advancement revoke @s only dynagen_creator:used_save_tool