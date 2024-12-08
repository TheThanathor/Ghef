
tag @s remove gm4_ghef.moving
scoreboard players set $ghef_moving gm4_ghef_data 0
summon item_display ~ ~ ~ {teleport_duration:1,billboard:"vertical",Tags:["gm4_ghef.club","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,2.5f,1f],scale:[2f,2f,2f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:ghef_club"}}}
data modify entity @n[type=item_display,tag=gm4_ghef.camera] teleport_duration set value 3
