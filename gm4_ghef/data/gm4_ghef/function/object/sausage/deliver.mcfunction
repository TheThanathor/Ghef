
scoreboard players set $stage gm4_ghef_data 1

scoreboard players add $strokes_left gm4_ghef_data 5
kill @s
execute at @s run playsound entity.villager.trade master @a ~ ~ ~ 1 1
scoreboard players add $sausages_delivered gm4_ghef_data 1