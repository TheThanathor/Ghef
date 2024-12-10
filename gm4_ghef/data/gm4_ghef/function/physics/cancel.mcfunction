
tp @s @n[type=marker,tag=gm4_ghef.saved_location]
scoreboard players set @s gm4_ghef.velocity.x 0
scoreboard players set @s gm4_ghef.velocity.y 0
scoreboard players set @s gm4_ghef.velocity.z 0

scoreboard players set $total_velocity gm4_ghef_data 0 
scoreboard players set $in_gravity gm4_ghef_data 0

function gm4_ghef:physics/rolling/reset_matrix

kill @n[type=marker,tag=gm4_ghef.saved_location]
