
# cook and deliver
execute if block ~.25 ~ ~.267 light_blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.picked_up,tag=!gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/cook
execute if block ~-.25 ~ ~.267 light_blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.picked_up,tag=!gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/cook
execute if block ~.25 ~ ~-.267 light_blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.picked_up,tag=!gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/cook
execute if block ~-.25 ~ ~-.267 light_blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.picked_up,tag=!gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/cook

execute if block ~.25 ~ ~.267 blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/deliver
execute if block ~-.25 ~ ~.267 blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/deliver
execute if block ~.25 ~ ~-.267 blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/deliver
execute if block ~-.25 ~ ~-.267 blue_glazed_terracotta on passengers if entity @s[tag=gm4_ghef.sausage.cooked] run function gm4_ghef:object/sausage/deliver

scoreboard players set $new_yaw gm4_ghef_data 1800

scoreboard players operation $new_yaw gm4_ghef_data -= $yaw_x10 gm4_ghef_data

# normalize
scoreboard players add $new_yaw gm4_ghef_data 1800
scoreboard players operation $new_yaw gm4_ghef_data %= #3600 gm4_ghef_data 
scoreboard players remove $new_yaw gm4_ghef_data 1800

scoreboard players operation $yaw_x10 gm4_ghef_data = $new_yaw gm4_ghef_data

scoreboard players operation $club_angle gm4_ghef_data = $yaw_x10 gm4_ghef_data
scoreboard players operation $club_angle gm4_ghef_data /= #10 gm4_ghef_data
scoreboard players add $club_angle gm4_ghef_data 180
execute if score $club_angle gm4_ghef_data matches 361.. run scoreboard players remove $club_angle gm4_ghef_data 360

# and make the ball roll
execute store result storage gm4_ghef:temp input.vx float 1 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp input.vz float 1 run scoreboard players get @s gm4_ghef.velocity.z
execute store result storage gm4_ghef:temp input.distance float 1 run scoreboard players get $moved_distance gm4_ghef_data
data modify storage gm4_ghef:temp input.diameter set value 348
function gm4_ghef:physics/rolling/compute_rolling_quaternion with storage gm4_ghef:temp input
data remove storage gm4_ghef:temp input
scoreboard players set $moved_distance gm4_ghef_data 0
data modify entity @s transformation.scale set value [3f,3f,3f]

# change remaining distance
scoreboard players operation $move_distance gm4_ghef_data *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation $move_distance gm4_ghef_data /= #100 gm4_ghef_data

# change velocity
scoreboard players operation @s gm4_ghef.velocity.z *= $bounce_percent.xz gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z *= #-1 gm4_ghef_data

# sound
playsound entity.armadillo.land master @a ~ ~ ~ 1 1.25 1

execute summon marker run function gm4_ghef:physics/bounce/get_facing
