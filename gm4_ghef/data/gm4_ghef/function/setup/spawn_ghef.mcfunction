
execute as @e[tag=gm4_ghef.entity] if score @s gm4_ghef.id = $processing_id gm4_ghef_data run kill @s
summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.main","gm4_ghef.entity","gm4_ghef.new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:ghef_dodecahedron","minecraft:custom_model_data":{colors:[8298751,8298751]}}}}
summon item_display ~ ~ ~ {teleport_duration:6,Tags:["gm4_ghef.camera","gm4_ghef.entity","gm4_ghef.new"],item:{id:"minecraft:air",count:1}}
scoreboard players operation @e[type=item_display,tag=gm4_ghef.new] gm4_ghef.id = $processing_id gm4_ghef_data
execute as @e[type=item_display,tag=gm4_ghef.new,tag=gm4_ghef.main] store result score @s gm4_ghef.diameter run data get entity @s transformation.scale[0] 172
tag @e[type=item_display,tag=gm4_ghef.new] remove gm4_ghef.new
