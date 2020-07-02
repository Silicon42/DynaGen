#make position and value sub-entries
data modify storage dynagen_creator: MasterJunctionList append value {}
data modify storage dynagen_creator: MasterJunctionList[-1].Pos set from entity @s Pos
execute if block ~ ~ ~ jigsaw[orientation=south_up] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value 0
execute if block ~ ~ ~ jigsaw[orientation=west_up] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value 1073741824
execute if block ~ ~ ~ jigsaw[orientation=north_up] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value -2147483648
execute if block ~ ~ ~ jigsaw[orientation=east_up] run data modify storage dynagen_creator: MasterJunctionList[-1].Rotation set value -1073741824
data modify storage dynagen_creator: MasterJunctionList[-1].Pool set from block ~ ~ ~ pool
