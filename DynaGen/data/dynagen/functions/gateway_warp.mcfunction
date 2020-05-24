#doesn't currently do anything really other than reset the advancement
#will likely be expanded to not automatically assume that gateways exist only in the End
execute if score #endEnabled DGvar matches 1 run function dynagen:lib/seed_new_area
advancement revoke @s only dynagen:used_gateway
