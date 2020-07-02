#must be called before calling dynagen:utils/fill_map/start
scoreboard objectives add FillMap dummy
team add FillMap
team modify FillMap color dark_blue
scoreboard objectives setdisplay sidebar.team.dark_blue FillMap
team join FillMap
scoreboard players set mapScale FillMap 4