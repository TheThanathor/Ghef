
# pick an empty location on the floor
scoreboard players set $attempts gm4_ghef_data 300
execute summon marker run function gm4_ghef:object/sausage/find_location

execute at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.sausage","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:sausage"}}}
kill @n[type=marker,tag=gm4_ghef.picked_location]
