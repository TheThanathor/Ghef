
execute store result entity @s Rotation[0] float 0.1 run scoreboard players get $yaw gm4_ghef_data
execute rotated as @s run function gm4_ghef:physics/raycast
kill @s
