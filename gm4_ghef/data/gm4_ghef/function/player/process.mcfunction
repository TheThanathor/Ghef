
spectate @n[type=item_display,tag=gm4_ghef.camera] @s[gamemode=spectator]

execute if predicate gm4_ghef:hold_left run scoreboard players add $club_angle gm4_ghef_data 4
execute if predicate gm4_ghef:hold_right run scoreboard players remove $club_angle gm4_ghef_data 4
execute if score $club_angle gm4_ghef_data matches 181.. run scoreboard players remove $club_angle gm4_ghef_data 360
execute if score $club_angle gm4_ghef_data matches ..-181 run scoreboard players add $club_angle gm4_ghef_data 360
