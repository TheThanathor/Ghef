
execute store result entity @s Rotation[0] float 0.1 run scoreboard players get $yaw_x10 gm4_ghef_data
execute rotated as @s as @n[type=item_display,tag=gm4_ghef.main] run function gm4_ghef:physics/raycast
kill @s
