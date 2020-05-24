#enables dimensional tp and portal/gateway triggers and starts processes the local area to add load detector based spreading command blocks
#only enable this if you are done protecting areas that you don't want affected as there is no way to later safely disable the load detectors without breaking the system

scoreboard players set #dgEnabled DGvar 1
function dynagen:lib/seed_new_area