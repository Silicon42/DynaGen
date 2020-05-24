function dynagen:lib/seed_new_area
advancement revoke @s only dynagen:to_overworld_or_nether
#can't actually check for collision w/ portal in the advancement
# b/c due to a bug, dimensions remember the last blocks you touched in them
# might work to use a schedule command for the next tick

#maybe include a portal checker to force the portal back if a structure damages it
#execute if data storage dynagen:storage {isNewArea:1b} run say "new area"
