
spectate @n[type=item_display,tag=gm4_ghef.camera] @s[gamemode=spectator]

execute if score $ghef_moving gm4_ghef_data matches 1.. run return 0

execute if predicate gm4_ghef:hold_left unless score $club_angle_change gm4_ghef_data matches 12.. run scoreboard players add $club_angle_change gm4_ghef_data 1
execute if predicate gm4_ghef:hold_right unless score $club_angle_change gm4_ghef_data matches ..-12 run scoreboard players remove $club_angle_change gm4_ghef_data 1
execute unless score $club_angle_change gm4_ghef_data matches 0 unless predicate gm4_ghef:hold_left unless predicate gm4_ghef:hold_right run scoreboard players set $club_angle_change gm4_ghef_data 0

scoreboard players operation $club_angle gm4_ghef_data += $club_angle_change gm4_ghef_data

execute if score $club_angle gm4_ghef_data matches 181.. run scoreboard players remove $club_angle gm4_ghef_data 360
execute if score $club_angle gm4_ghef_data matches ..-181 run scoreboard players add $club_angle gm4_ghef_data 360


execute if predicate gm4_ghef:charge_club unless score $club_power_direction gm4_ghef_data matches -1 run scoreboard players add $club_power gm4_ghef_data 1
execute if predicate gm4_ghef:charge_club if score $club_power_direction gm4_ghef_data matches -1 run scoreboard players remove $club_power gm4_ghef_data 1

execute if predicate gm4_ghef:charge_club unless score $club_power_direction gm4_ghef_data matches -1 if score $club_power gm4_ghef_data matches 50.. run scoreboard players set $club_power_direction gm4_ghef_data -1
execute if predicate gm4_ghef:charge_club if score $club_power_direction gm4_ghef_data matches -1 if score $club_power gm4_ghef_data matches ..0 run scoreboard players set $club_power_direction gm4_ghef_data 1

execute unless predicate gm4_ghef:charge_club if score $club_power gm4_ghef_data matches 1.. at @s run function gm4_ghef:club/hit

scoreboard players operation $club_power_percent gm4_ghef_data = $club_power gm4_ghef_data
scoreboard players operation $club_power_percent gm4_ghef_data += $club_power_percent gm4_ghef_data

execute if score $club_power gm4_ghef_data matches 1.. run title @p[tag=gm4_ghef.player] actionbar ["Club Power: ",{"score":{"name":"$club_power_percent","objective":"gm4_ghef_data"}},"%"]
