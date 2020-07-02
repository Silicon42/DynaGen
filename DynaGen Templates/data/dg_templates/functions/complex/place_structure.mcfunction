# an example of a more complex structure that starts out randomly rotated and has random pools of attached sub-structures, loot containers, and structure integrity

#always remember to kill your marker entities
kill

#always start the lcg if you want random anything, such as structure placement, loot, or layout
function dynagen:lib/lcg_start

#for the purpose of this example, we'll use underground since that's fairly common
function dynagen:lib/placement/underground
execute if score #placeSuccess DGvar matches 1 positioned as @s run function dg_templates:complex/load_structure