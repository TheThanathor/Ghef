
$data modify entity 0-0-0-0-0 transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
execute store result score $total_velocity gm4_ghef_data run data get entity 0-0-0-0-0 transformation.scale[0] 1000

execute summon marker run function gm4_ghef:physics/get_facing with storage gm4_ghef:temp target

scoreboard players operation $move_distance gm4_ghef_data = $total_velocity gm4_ghef_data
$execute if score $total_velocity gm4_ghef_data matches 1.. facing ~$(x) ~$(y) ~$(z) run function gm4_ghef:physics/raycast
