
# gravity
execute if block ~ ~-0.267 ~ #gm4_ghef:no_collision run scoreboard players operation @s gm4_ghef.acceleration.y += $gravity_x1 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.y += @s gm4_ghef.acceleration.y
# set gravity to 0 if ground is hit
execute unless block ~ ~-0.267 ~ #gm4_ghef:no_collision if score @s gm4_ghef.velocity.y <= $bounce_cutoff gm4_ghef_data run function gm4_ghef:physics/bounce/y

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
execute store result score $pos.x gm4_ghef_data run data get entity @s Pos[0] 1000
scoreboard players operation $distance.x gm4_ghef_data = $pos.x gm4_ghef_data
scoreboard players operation $distance.x gm4_ghef_data += @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp target.distance.x float 0.001 run scoreboard players operation $distance.x gm4_ghef_data -= $pos.x gm4_ghef_data

execute store result score $pos.y gm4_ghef_data run data get entity @s Pos[1] 1000
scoreboard players operation $distance.y gm4_ghef_data = $pos.y gm4_ghef_data
scoreboard players operation $distance.y gm4_ghef_data += @s gm4_ghef.velocity.y
execute store result storage gm4_ghef:temp target.distance.y float 0.001 run scoreboard players operation $distance.y gm4_ghef_data -= $pos.y gm4_ghef_data

execute store result score $pos.z gm4_ghef_data run data get entity @s Pos[2] 1000
scoreboard players operation $distance.z gm4_ghef_data = $pos.z gm4_ghef_data
scoreboard players operation $distance.z gm4_ghef_data += @s gm4_ghef.velocity.z
execute store result storage gm4_ghef:temp target.distance.z float 0.001 run scoreboard players operation $distance.z gm4_ghef_data -= $pos.z gm4_ghef_data

function gm4_ghef:physics/get_distance with storage gm4_ghef:temp target.distance

# if no distance will be moved don't run the rest
execute if score $move_distance gm4_ghef_data matches 0 run return 0
scoreboard players operation $interpolation_calc gm4_ghef_data = $move_distance gm4_ghef_data

# spawn a marker and move it to the target position, we then raycast to it so Ghef doesn't phase through terrain
execute store result storage gm4_ghef:temp target.facing.x float 0.001 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp target.facing.y float 0.001 run scoreboard players get @s gm4_ghef.velocity.y
execute store result storage gm4_ghef:temp target.facing.z float 0.001 run scoreboard players get @s gm4_ghef.velocity.z
function gm4_ghef:physics/get_facing with storage gm4_ghef:temp target.facing
data remove storage gm4_ghef:temp target

# move camera, it has higher teleport delay so it will lag behind a bit
# the camera delay is reduced more the more speed Ghef has
scoreboard players set $interpolation gm4_ghef_data 12
scoreboard players operation $interpolation_calc gm4_ghef_data /= #100 gm4_ghef_data
scoreboard players operation $interpolation gm4_ghef_data -= $interpolation_calc gm4_ghef_data
execute unless score $interpolation gm4_ghef_data matches 2..12 run scoreboard players set $interpolation gm4_ghef_data 2

execute store result entity @n[type=item_display,tag=gm4_ghef.camera] teleport_duration int 1 run scoreboard players get $interpolation gm4_ghef_data

execute at @s run tp @n[type=item_display,tag=gm4_ghef.camera] ~ ~5 ~3 facing ~ ~ ~
