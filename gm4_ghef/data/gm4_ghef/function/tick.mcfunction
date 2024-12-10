schedule function gm4_ghef:tick 1t

# we do not run anything if the club is hitting the ball!
execute if score $club_moving gm4_ghef_data matches 1 run return 0

# player
execute as @p[tag=gm4_ghef.player] run function gm4_ghef:player/process

# ghef
execute as @n[type=item_display,tag=gm4_ghef.main] at @s run function gm4_ghef:physics/process

# rats
execute as @e[type=item_display,tag=gm4_ghef.rat] at @s run function gm4_ghef:object/rat/process

# move camera (this will also move the club)
execute store result storage gm4_ghef:temp club.angle int 1 run scoreboard players get $club_angle gm4_ghef_data
function gm4_ghef:club/set with storage gm4_ghef:temp club
data remove storage gm4_ghef:temp club

# arrows
kill @e[type=item_display,tag=gm4_ghef.arrow.remove]
tag @e[type=item_display,tag=gm4_ghef.arrow] add gm4_ghef.arrow.remove
execute if score $stage gm4_ghef_data matches 1 at @e[type=item_display,tag=gm4_ghef.sausage,tag=!gm4_ghef.sausage.picked_up] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}
execute if score $stage gm4_ghef_data matches 2 at @e[type=item_display,tag=gm4_ghef.stove] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}
execute if score $stage gm4_ghef_data matches 3 at @e[type=item_display,tag=gm4_ghef.delivery] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}

title @a[gamemode=spectator,tag=gm4_ghef.player] actionbar {"score":{"name":"$strokes_left","objective":"gm4_ghef_data"}}
