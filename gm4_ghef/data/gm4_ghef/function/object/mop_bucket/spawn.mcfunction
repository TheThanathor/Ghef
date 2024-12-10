
# pick an empty location on the floor
scoreboard players set $attempts gm4_ghef_data 100
execute summon marker run function gm4_ghef:object/find_location

execute store result score $rat_type gm4_ghef_data run random value 1..6
execute store result score $rotation gm4_ghef_data run random value 1..2
execute if score $rotation gm4_ghef_data matches 1 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:5,Tags:["gm4_ghef.mop_bucket","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:mop_bucket"}}}
execute if score $rotation gm4_ghef_data matches 2 at @n[type=marker,tag=gm4_ghef.picked_location] run summon item_display ~ ~ ~ {Rotation:[90F,0F],shadow_radius:0.25,teleport_duration:5,Tags:["gm4_ghef.mop_bucket","gm4_ghef.obstacle","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:mop_bucket"}}}
execute at @n[type=marker,tag=gm4_ghef.picked_location] run fill ~ ~ ~ ~ ~ ~ barrier replace #gm4_ghef:no_collision
kill @n[type=marker,tag=gm4_ghef.picked_location]
