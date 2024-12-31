
execute store result storage gm4_ghef:temp input.vx float 1 run scoreboard players get @s gm4_ghef.velocity.x
execute store result storage gm4_ghef:temp input.vz float 1 run scoreboard players get @s gm4_ghef.velocity.z
execute store result storage gm4_ghef:temp input.distance float 1 run scoreboard players get $moved_distance gm4_ghef_data
execute store result storage gm4_ghef:temp input.diameter int 1 run scoreboard players get @s gm4_ghef.diameter
function gm4_ghef:physics/rolling/compute_rolling_quaternion with storage gm4_ghef:temp input
data remove storage gm4_ghef:temp input
scoreboard players set $moved_distance gm4_ghef_data 0
data modify entity @s transformation.scale set value [3f,3f,3f]
