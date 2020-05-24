#doesn't currently do anything really other than reset the advancement
execute if score #endEnabled DGvar matches 1 run function dynagen:lib/seed_new_area
advancement revoke @s only dynagen:to_end
