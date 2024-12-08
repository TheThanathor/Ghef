
# gravity
execute if block ~ ~-0.267 ~ #gm4_ghef:no_collision run scoreboard players operation @s gm4_ghef.acceleration.y += $gravity_x1 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.y += @s gm4_ghef.acceleration.y
# set gravity to 0 if ground is hit
execute unless block ~ ~-0.267 ~ #gm4_ghef:no_collision if score @s gm4_ghef.velocity.y <= $bounce_cutoff_speed gm4_ghef_data run function gm4_ghef:physics/bounce/y

# update acceleration and velocity. y axis is calculated without friction
scoreboard players operation @s gm4_ghef.acceleration.x = @s gm4_ghef.velocity.x
scoreboard players operation @s gm4_ghef.acceleration.x *= $friction_x100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.acceleration.x /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x += @s gm4_ghef.acceleration.x

scoreboard players operation @s gm4_ghef.acceleration.z = @s gm4_ghef.velocity.z
scoreboard players operation @s gm4_ghef.acceleration.z *= $friction_x100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.acceleration.z /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z += @s gm4_ghef.acceleration.z

# cut velocity if it is too slow
scoreboard players set @s[scores={gm4_ghef.velocity.x=-10..10}] gm4_ghef.velocity.x 0
scoreboard players set @s[scores={gm4_ghef.velocity.y=-10..10}] gm4_ghef.velocity.y 0
scoreboard players set @s[scores={gm4_ghef.velocity.z=-10..10}] gm4_ghef.velocity.z 0

# get distance to target
execute store result storage gm4_ghef:temp target.x float 0.001 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp target.y float 0.001 run scoreboard players get @s gm4_ghef.velocity.y
execute store result storage gm4_ghef:temp target.z float 0.001 run scoreboard players get @s gm4_ghef.velocity.z
function gm4_ghef:physics/get_distance with storage gm4_ghef:temp target

# check if golfclub needs to be added / removed
execute if entity @s[tag=gm4_ghef.moving] if score $total_velocity gm4_ghef_data matches 0 run function gm4_ghef:club/spawn
execute if entity @s[tag=!gm4_ghef.moving] if score $total_velocity gm4_ghef_data matches 1.. run function gm4_ghef:club/remove

execute if score $total_velocity gm4_ghef_data matches 0 run return 0
# move camera, it has higher teleport delay so it will lag behind a bit
# the camera delay is reduced more the more speed Ghef has
scoreboard players set $interpolation gm4_ghef_data 12
scoreboard players operation $interpolation_calc gm4_ghef_data = $total_velocity gm4_ghef_data
scoreboard players operation $interpolation_calc gm4_ghef_data /= #100 gm4_ghef_data
scoreboard players operation $interpolation gm4_ghef_data -= $interpolation_calc gm4_ghef_data
execute unless score $interpolation gm4_ghef_data matches 2..12 run scoreboard players set $interpolation gm4_ghef_data 2

execute store result entity @n[type=item_display,tag=gm4_ghef.camera] teleport_duration int 1 run scoreboard players get $interpolation gm4_ghef_data

# cleanup
data remove storage gm4_ghef:temp target
