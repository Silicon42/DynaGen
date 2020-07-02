#attempts to place the structure on the surface

#OUTPUT: entity y-position
#NOTE: since spreadplayers fails on water/lava or other damaging blocks, this placement must also fail on them
#generally shouldn't be used in water biomes

#prevent spreadplayers from moving the entity horizontally
#this small fill is enough as long as the entity is on the NW corner of the block (~-0.5 ~0 ~-0.5)
fill ~-1 255 ~-1 ~ 255 ~ water
setblock ~ 255 ~ air
execute store success score #placeSuccess DGvar run spreadplayers ~ ~ 0 1 false @s
fill ~-1 255 ~-1 ~ 255 ~ air

#NOTE: likely waiting until 1.16 to implement a version that ignores trees and other plant products
