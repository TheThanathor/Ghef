schedule function gm4_ghef:tick 1t
execute if score $loop gm4_ghef_data matches 1 run tellraw @a {"color":"red","text":"Infinite Loop!"}
scoreboard players set $loop gm4_ghef_data 1

execute as @n[type=item_display,tag=gm4_ghef.main] at @s run function gm4_ghef:physics/process

spectate @n[type=item_display,tag=gm4_ghef.camera] @p[tag=gm4_ghef.player]

scoreboard players set $loop gm4_ghef_data 0
