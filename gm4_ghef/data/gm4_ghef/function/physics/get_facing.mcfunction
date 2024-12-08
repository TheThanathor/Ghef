
$tp @s ~ ~ ~ facing ~$(x) ~$(y) ~$(z)
execute store result score $yaw gm4_ghef_data run data get entity @s Rotation[0] 10
execute if score $move_distance gm4_ghef_data matches 1.. rotated as @n[type=item_display,tag=gm4_ghef.main] run function gm4_ghef:physics/raycast
