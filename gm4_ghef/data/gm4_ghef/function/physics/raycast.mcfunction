
# fell in hole
execute if block ~ ~-.267 ~ black_concrete run return run function gm4_ghef:physics/cancel

# pickup sausage
execute unless entity @n[type=item_display,tag=gm4_ghef.sausage.picked_up] as @n[type=item_display,tag=gm4_ghef.sausage,distance=..1] run function gm4_ghef:object/sausage/pickup

# obstacle
execute if entity @n[type=item_display,tag=gm4_ghef.banana_peel,distance=..0.75] run function gm4_ghef:object/banana_peel/activate
execute if entity @n[type=item_display,tag=gm4_ghef.rat,distance=..0.55] run function gm4_ghef:object/rat/activate
execute unless score $in_puddle gm4_ghef_data matches 1 if entity @n[type=item_display,tag=gm4_ghef.puddle,distance=..1] run scoreboard players set $in_puddle gm4_ghef_data 1

# bouncing
execute if score $yaw_x10 gm4_ghef_data matches -1799..-1 if block ~.267 ~ ~.25 #gm4_ghef:full_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw_x10 gm4_ghef_data matches -1799..-1 if block ~.267 ~ ~-.25 #gm4_ghef:full_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw_x10 gm4_ghef_data matches 1..1799 unless block ~-.267 ~ ~.25 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw_x10 gm4_ghef_data matches 1..1799 unless block ~-.267 ~ ~-.25 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/x
execute if score $yaw_x10 gm4_ghef_data matches -901..899 unless block ~.25 ~ ~.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z
execute if score $yaw_x10 gm4_ghef_data matches -901..899 unless block ~-.25 ~ ~.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z
execute unless score $yaw_x10 gm4_ghef_data matches -899..901 unless block ~.25 ~ ~-.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z
execute unless score $yaw_x10 gm4_ghef_data matches -899..901 unless block ~-.25 ~ ~-.267 #gm4_ghef:no_collision run return run function gm4_ghef:physics/bounce/z

# move steps
scoreboard players set $move_step gm4_ghef_data 0
execute if score $move_distance gm4_ghef_data matches 1.. positioned ^ ^ ^0.001 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~ ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 1 
execute if score $move_distance gm4_ghef_data matches 10.. if score $move_step gm4_ghef_data matches 1 positioned ^ ^ ^0.01 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~ ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 10 
execute if score $move_distance gm4_ghef_data matches 50.. if score $move_step gm4_ghef_data matches 10 positioned ^ ^ ^0.05 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~ ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 50
execute if score $move_distance gm4_ghef_data matches 100.. if score $move_step gm4_ghef_data matches 50 positioned ^ ^ ^0.1 if block ~.25 ~.25 ~.25 #gm4_ghef:no_collision if block ~-.25 ~ ~-.25 #gm4_ghef:no_collision run scoreboard players set $move_step gm4_ghef_data 100 

scoreboard players operation $move_distance gm4_ghef_data -= $move_step gm4_ghef_data
scoreboard players operation $moved_distance gm4_ghef_data += $move_step gm4_ghef_data
execute if score $move_step gm4_ghef_data matches 1 positioned ^ ^ ^0.001 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 10 positioned ^ ^ ^0.01 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 50 positioned ^ ^ ^0.05 run return run function gm4_ghef:physics/raycast
execute if score $move_step gm4_ghef_data matches 100 positioned ^ ^ ^0.1 run return run function gm4_ghef:physics/raycast

# otherwise move here
tp @s ~ ~ ~

# and make the ball roll
execute store result storage gm4_ghef:temp input.vx float 1 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp input.vz float 1 run scoreboard players get @s gm4_ghef.velocity.z
execute store result storage gm4_ghef:temp input.distance float 1 run scoreboard players get $moved_distance gm4_ghef_data
execute store result storage gm4_ghef:temp input.diameter int 1 run scoreboard players get @s gm4_ghef.diameter
function gm4_ghef:physics/rolling/compute_rolling_quaternion with storage gm4_ghef:temp input
data remove storage gm4_ghef:temp input
scoreboard players set $moved_distance gm4_ghef_data 0
data modify entity @s transformation.scale set value [3f,3f,3f]
