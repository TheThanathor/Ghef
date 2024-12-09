
scoreboard players operation $yaw_x10 gm4_ghef_data *= #-1 gm4_ghef_data

# and make the ball roll
execute store result storage gm4_ghef:temp input.vx float 1 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp input.vz float 1 run scoreboard players get @s gm4_ghef.velocity.z
execute store result storage gm4_ghef:temp input.distance float 1 run scoreboard players get $moved_distance gm4_ghef_data
data modify storage gm4_ghef:temp input.diameter set value 348
function gm4_ghef:physics/rolling/compute_rolling_matrix with storage gm4_ghef:temp input
data remove storage gm4_ghef:temp input
scoreboard players set $moved_distance gm4_ghef_data 0
data modify entity @s transformation.scale set value [3f,3f,3f]

# change remaining distance
scoreboard players operation $move_distance gm4_ghef_data *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation $move_distance gm4_ghef_data /= #100 gm4_ghef_data

# change velocity
scoreboard players operation @s gm4_ghef.velocity.x *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x *= #-1 gm4_ghef_data

# sound
playsound entity.armadillo.land master @a ~ ~ ~ 1 1.25 1

execute summon marker run function gm4_ghef:physics/bounce/get_facing
