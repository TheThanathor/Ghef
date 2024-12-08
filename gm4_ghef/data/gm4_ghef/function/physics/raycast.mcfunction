
execute if score $yaw gm4_ghef_data matches -1799..-1 unless block ~.267 ~ ~ #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw gm4_ghef_data matches 1..1799 unless block ~-.267 ~ ~ #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw gm4_ghef_data matches -901..899 unless block ~ ~ ~.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z
execute unless score $yaw gm4_ghef_data matches -899..901 unless block ~ ~ ~-.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z

scoreboard players set $move_step gm4_ghef_data 0
execute if score $move_distance gm4_ghef_data matches 1.. positioned ^ ^ ^0.001 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~-.24 ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 1 
execute if score $move_distance gm4_ghef_data matches 10.. if score $move_step gm4_ghef_data matches 1 positioned ^ ^ ^0.01 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~-.24 ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 10 
execute if score $move_distance gm4_ghef_data matches 50.. if score $move_step gm4_ghef_data matches 10 positioned ^ ^ ^0.05 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~-.24 ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 50
execute if score $move_distance gm4_ghef_data matches 100.. if score $move_step gm4_ghef_data matches 50 positioned ^ ^ ^0.1 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~-.24 ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 100 

scoreboard players operation $move_distance gm4_ghef_data -= $move_step gm4_ghef_data
execute if score $move_step gm4_ghef_data matches 1 positioned ^ ^ ^0.001 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 10 positioned ^ ^ ^0.01 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 50 positioned ^ ^ ^0.05 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 100 positioned ^ ^ ^0.1 run return run function gm4_ghef:physics/raycast

# otherwise move here
tp @s ~ ~ ~ ~ 0

#hi