
scoreboard players set $ghef_found gm4_ghef_data 1

## TODO: make the club move so it doesn't need to billboard
# move camera (this will also move the club)
execute store result storage gm4_ghef:temp club.angle int 1 run scoreboard players get $club_angle gm4_ghef_data
function gm4_ghef:club/set with storage gm4_ghef:temp club
data remove storage gm4_ghef:temp club

# store important data
# | Processing Data
scoreboard players operation $detection_distance gm4_ghef_data = @s gm4_ghef.diameter
execute store result storage gm4_ghef:temp ghef_stats.detection.corner float 0.0005 run scoreboard players add $detection_distance gm4_ghef_data 10
execute store result storage gm4_ghef:temp ghef_stats.detection.distance float 0.001 run scoreboard players add $detection_distance gm4_ghef_data 10
execute store result storage gm4_ghef:temp ghef_stats.diameter float 0.001 run scoreboard players get @s gm4_ghef.diameter
execute store result storage gm4_ghef:temp ghef_stats.radius float 0.0005 run scoreboard players get @s gm4_ghef.diameter

# gravity
scoreboard players set $in_gravity gm4_ghef_data 0
execute if block ~.25 ~-0.267 ~.25 #gm4_ghef:no_collision if block ~-.25 ~-0.267 ~-.25 #gm4_ghef:no_collision if block ~-.25 ~-0.267 ~.25 #gm4_ghef:no_collision if block ~.25 ~-0.267 ~-.25 #gm4_ghef:no_collision run scoreboard players set $in_gravity gm4_ghef_data 1
execute if score $in_gravity gm4_ghef_data matches 1 run scoreboard players operation @s gm4_ghef.acceleration.y += $gravity_acceleration gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.y += @s gm4_ghef.acceleration.y
# set gravity to 0 if ground is hit
execute if block ~.25 ~-0.267 ~ #gm4_ghef:full_collision if score @s gm4_ghef.velocity.y matches ..-1 run function gm4_ghef:physics/bounce/y
execute if block ~ ~-0.267 ~.25 #gm4_ghef:full_collision if score @s gm4_ghef.velocity.y matches ..-1 run function gm4_ghef:physics/bounce/y
execute if block ~-.25 ~-0.267 ~ #gm4_ghef:full_collision if score @s gm4_ghef.velocity.y matches ..-1 run function gm4_ghef:physics/bounce/y
execute if block ~ ~-0.267 ~-.25 #gm4_ghef:full_collision if score @s gm4_ghef.velocity.y matches ..-1 run function gm4_ghef:physics/bounce/y
# cut velocity if it is too slow
execute if entity @s[scores={gm4_ghef.velocity.x=-100..100,gm4_ghef.velocity.y=-100..100,gm4_ghef.velocity.z=-100..100}] run function gm4_ghef:physics/cut_velocity

# get distance to target
execute store result storage gm4_ghef:temp ghef_stats.target.x float 0.0001 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp ghef_stats.target.y float 0.0001 run scoreboard players get @s gm4_ghef.velocity.y
execute store result storage gm4_ghef:temp ghef_stats.target.z float 0.0001 run scoreboard players get @s gm4_ghef.velocity.z
function gm4_ghef:physics/get_distance with storage gm4_ghef:temp ghef_stats.target

# check if golfclub needs to be added / removed
execute if entity @s[tag=gm4_ghef.moving] if score $total_velocity gm4_ghef_data matches 0 if score $in_gravity gm4_ghef_data matches 0 run function gm4_ghef:turn/start
execute if entity @s[tag=!gm4_ghef.moving,tag=!gm4_ghef.club_removing] if score $total_velocity gm4_ghef_data matches 1.. run function gm4_ghef:turn/end

# if there is no velocity no need to run the rest of this
execute if score $total_velocity gm4_ghef_data matches 0 run return 0

# update acceleration and velocity. y axis is calculated without friction
scoreboard players operation @s gm4_ghef.acceleration.x = @s gm4_ghef.velocity.x
scoreboard players operation @s gm4_ghef.acceleration.x *= $friction_percentage_loss gm4_ghef_data
scoreboard players operation @s gm4_ghef.acceleration.x /= #100 gm4_ghef_data

scoreboard players operation @s gm4_ghef.acceleration.z = @s gm4_ghef.velocity.z
scoreboard players operation @s gm4_ghef.acceleration.z *= $friction_percentage_loss gm4_ghef_data
scoreboard players operation @s gm4_ghef.acceleration.z /= #100 gm4_ghef_data

execute if score $in_puddle gm4_ghef_data matches 1 run function gm4_ghef:object/puddle/effect

scoreboard players operation @s gm4_ghef.velocity.x += @s gm4_ghef.acceleration.x
scoreboard players operation @s gm4_ghef.velocity.z += @s gm4_ghef.acceleration.z

scoreboard players set $in_puddle gm4_ghef_data 0

# move camera, it has higher teleport delay so it will lag behind a bit
# the camera delay is reduced more the more speed Ghef has
scoreboard players set $interpolation gm4_ghef_data 12
scoreboard players operation $interpolation_calc gm4_ghef_data = $total_velocity gm4_ghef_data
scoreboard players operation $interpolation_calc gm4_ghef_data /= #1000 gm4_ghef_data
scoreboard players operation $interpolation gm4_ghef_data -= $interpolation_calc gm4_ghef_data
execute unless score $interpolation gm4_ghef_data matches 2..12 run scoreboard players set $interpolation gm4_ghef_data 2

execute store result entity @n[type=item_display,tag=gm4_ghef.camera] teleport_duration int 1 run scoreboard players get $interpolation gm4_ghef_data

# cleanup
data remove storage gm4_ghef:temp ghef_stats
