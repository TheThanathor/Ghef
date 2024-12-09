
kill @e[tag=gm4_ghef.entity]
summon item_display ~ ~ ~ {shadow_radius:0.25,teleport_duration:1,Tags:["gm4_ghef.main","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},item_display:"head",item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:ghef_dodecahedron","minecraft:custom_model_data":{colors:[8298751,8298751]}}}}
summon item_display ~ ~ ~ {teleport_duration:6,Tags:["gm4_ghef.camera","gm4_ghef.entity"],item:{id:"minecraft:air",count:1}}
execute as @e[type=item_display,tag=gm4_ghef.main] run function gm4_ghef:physics/rolling/reset_matrix
