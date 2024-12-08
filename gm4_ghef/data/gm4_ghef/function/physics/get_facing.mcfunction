
$tp @s ~ ~ ~ facing ~$(x) ~$(y) ~$(z)
execute store result score $yaw_x10 gm4_ghef_data run data get entity @s Rotation[0] 10
kill @s
