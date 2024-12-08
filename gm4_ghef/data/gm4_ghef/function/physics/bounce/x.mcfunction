
scoreboard players operation $yaw gm4_ghef_data *= #-1 gm4_ghef_data

# change remaining distance
scoreboard players operation $move_distance gm4_ghef_data *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation $move_distance gm4_ghef_data /= #100 gm4_ghef_data

# change velocity
scoreboard players operation @s gm4_ghef.velocity.x *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x *= #-1 gm4_ghef_data

execute summon marker run function gm4_ghef:physics/bounce/get_facing
