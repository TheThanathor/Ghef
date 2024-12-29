
# grab this player's ID
execute store result score $processing_id gm4_ghef_data run scoreboard players get @s gm4_ghef.id
tag @s add gm4_ghef.processing_player

# make sure all players are in spectator and spectating their camera
#gamemode spectator @s
execute as @e[type=item_display,tag=gm4_ghef.camera] if score @s gm4_ghef.id = $processing_id gm4_ghef_data run spectate @s @p[tag=gm4_ghef.processing_player]

# ghef
scoreboard players set $ghef_found gm4_ghef_data 0
scoreboard players set $total_velocity gm4_ghef_data 0
execute as @e[type=item_display,tag=gm4_ghef.main] if score @s gm4_ghef.id = $processing_id gm4_ghef_data at @s run function gm4_ghef:physics/process
execute if score $ghef_found gm4_ghef_data matches 0 positioned ~ ~5 ~ run function gm4_ghef:setup/spawn_ghef

# arrows
#kill @e[type=item_display,tag=gm4_ghef.arrow.remove]
#tag @e[type=item_display,tag=gm4_ghef.arrow] add gm4_ghef.arrow.remove
#execute if score $stage gm4_ghef_data matches 1 at @e[type=item_display,tag=gm4_ghef.sausage,tag=!gm4_ghef.sausage.picked_up] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}
#execute if score $stage gm4_ghef_data matches 2 at @e[type=item_display,tag=gm4_ghef.stove.on] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}
#execute if score $stage gm4_ghef_data matches 3 at @e[type=item_display,tag=gm4_ghef.delivery.on] run summon item_display ~ ~.75 ~ {billboard:"vertical",teleport_duration:1,Tags:["gm4_ghef.arrow","gm4_ghef.entity"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:white_dye",count:1,components:{"minecraft:item_model":"ghef:arrow"}}}

#title @s actionbar {"score":{"name":"$strokes_left","objective":"gm4_ghef_data"}}

# cleanup
tag @s remove gm4_ghef.processing_player

## /// TODO: improve this code
# camera movement and club charging
execute unless score $total_velocity gm4_ghef_data matches 0 run return 0

execute if predicate gm4_ghef:hold_left unless predicate gm4_ghef:charge_club run scoreboard players operation $club_angle gm4_ghef_data += $angle_change_per_tick gm4_ghef_data
execute if predicate gm4_ghef:hold_right unless predicate gm4_ghef:charge_club run scoreboard players operation $club_angle gm4_ghef_data -= $angle_change_per_tick gm4_ghef_data

execute if predicate gm4_ghef:hold_left run scoreboard players set $holding_angle_change gm4_ghef_data 2
execute if predicate gm4_ghef:hold_right run scoreboard players set $holding_angle_change gm4_ghef_data 2
execute if score $holding_angle_change gm4_ghef_data matches 1.. run scoreboard players remove $holding_angle_change gm4_ghef_data 1
execute if score $holding_angle_change gm4_ghef_data matches 1.. unless score $angle_change_per_tick gm4_ghef_data matches 10.. run scoreboard players add $angle_change_per_tick gm4_ghef_data 1
execute unless score $holding_angle_change gm4_ghef_data matches 1.. run scoreboard players set $angle_change_per_tick gm4_ghef_data 1

execute if score $club_angle gm4_ghef_data matches 181.. run scoreboard players remove $club_angle gm4_ghef_data 360
execute if score $club_angle gm4_ghef_data matches ..-181 run scoreboard players add $club_angle gm4_ghef_data 360

execute if predicate gm4_ghef:charge_club unless score $club_power_direction gm4_ghef_data matches -1 run scoreboard players add $club_power gm4_ghef_data 1
execute if predicate gm4_ghef:charge_club if score $club_power_direction gm4_ghef_data matches -1 run scoreboard players remove $club_power gm4_ghef_data 1

execute if predicate gm4_ghef:charge_club unless score $club_power_direction gm4_ghef_data matches -1 if score $club_power gm4_ghef_data matches 25.. run scoreboard players set $club_power_direction gm4_ghef_data -1
execute if predicate gm4_ghef:charge_club if score $club_power_direction gm4_ghef_data matches -1 if score $club_power gm4_ghef_data matches ..0 run scoreboard players set $club_power_direction gm4_ghef_data 1

execute store result storage gm4_ghef:temp club.angle float -1.2 run scoreboard players get $club_power gm4_ghef_data
execute as @n[type=item_display,tag=gm4_ghef.club] at @s run function gm4_ghef:club/set_angle with storage gm4_ghef:temp club
data remove storage gm4_ghef:temp club

execute unless predicate gm4_ghef:charge_club if score $club_power gm4_ghef_data matches 1.. at @s run function gm4_ghef:club/prep_hit
## ///
