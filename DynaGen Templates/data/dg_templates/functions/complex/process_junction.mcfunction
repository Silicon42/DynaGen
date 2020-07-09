# processes Junctions from the list recursively

#move the entity to the Junction's location
data modify entity @s Pos set from storage dynagen: JunctionList[0].Pos

#match the pool to the matching function
execute if data storage dynagen: JunctionList[0].Pool{Name:"dg_template:corridor"} positioned as @s run function dg_templates:complex/pools/choose_corridor
execute if data storage dynagen: JunctionList[0].Pool{Name:"dg_template:room"} positioned as @s run function dg_templates:complex/pools/choose_room

#decrement and call next iteration if applicable
data remove storage dynagen: JunctionList[0]
scoreboard players remove #rollIndex DGvar 1
execute if score #rollIndex DGvar matches 1.. positioned as @s run function dg_templates:complex/process_junction