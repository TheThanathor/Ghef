
scoreboard players set $new_yaw gm4_ghef_data 1800

scoreboard players operation $new_yaw gm4_ghef_data -= $yaw gm4_ghef_data

# normalize
scoreboard players add $new_yaw gm4_ghef_data 1800
scoreboard players operation $new_yaw gm4_ghef_data %= #3600 gm4_ghef_data 
scoreboard players remove $new_yaw gm4_ghef_data 1800

scoreboard players operation $yaw gm4_ghef_data = $new_yaw gm4_ghef_data

# change remaining distance
scoreboard players operation $move_distance gm4_ghef_data *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation $move_distance gm4_ghef_data /= #100 gm4_ghef_data

# change velocity
scoreboard players operation @s gm4_ghef.velocity.z *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z *= #-1 gm4_ghef_data

execute summon marker run function gm4_ghef:physics/bounce/get_facing
