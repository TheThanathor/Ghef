
scoreboard players set $club_moving gm4_ghef_data 0

scoreboard players operation @n[type=item_display,tag=gm4_ghef.main] gm4_ghef.velocity.x = $velocity.x gm4_ghef_data
scoreboard players operation @n[type=item_display,tag=gm4_ghef.main] gm4_ghef.velocity.z = $velocity.z gm4_ghef_data

tag @n[type=item_display,tag=gm4_ghef.club] add gm4_ghef.club_removing
schedule function gm4_ghef:club/delete 5t

# sound
execute at @n[type=item_display,tag=gm4_ghef.main] run playsound entity.armadillo.land master @a ~ ~ ~ 1 1.25 1
