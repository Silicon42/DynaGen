#for single structures without any random determination of subcomponents or orientation

#always remember to kill your marker entities
kill
#for the purpose of this example, we'll use on_surface since that's fairly common
function dynagen:lib/placement/on_surface
execute if score #placeSuccess DGvar matches 1 positioned as @s run function dg_templates:basic/load_structure