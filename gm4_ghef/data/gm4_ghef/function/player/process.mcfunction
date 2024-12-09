
spectate @n[type=item_display,tag=gm4_ghef.camera] @s[gamemode=spectator]

execute if score $ghef_moving gm4_ghef_data matches 1.. run return 0

execute if predicate gm4_ghef:hold_left unless predicate gm4_ghef:charge_club run scoreboard players add $club_angle gm4_ghef_data 4
execute if predicate gm4_ghef:hold_right unless predicate gm4_ghef:charge_club run scoreboard players remove $club_angle gm4_ghef_data 4

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
