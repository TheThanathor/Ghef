
# pick an empty location on the floor
scoreboard players set $attempts gm4_ghef_data 100
execute summon marker run function gm4_ghef:object/find_location

execute store result score $rat_type gm4_ghef_data run random value 1..6
execute if score $rat_type gm4_ghef_data matches 1 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_gray"}}}
execute if score $rat_type gm4_ghef_data matches 2 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_brown"}}}
execute if score $rat_type gm4_ghef_data matches 3 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_black"}}}
execute if score $rat_type gm4_ghef_data matches 4 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {Rotation:[90F,0F],shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_gray"}}}
execute if score $rat_type gm4_ghef_data matches 5 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {Rotation:[90F,0F],shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_brown"}}}
execute if score $rat_type gm4_ghef_data matches 6 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {Rotation:[90F,0F],shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.rat","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:rat_black"}}}
kill @n[type=marker,tag=gm4_ghef.picked_location]