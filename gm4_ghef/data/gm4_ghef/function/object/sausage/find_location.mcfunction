
tag @s add gm4_ghef.picked_location

execute at @n[type=item_display,tag=gm4_ghef.main] run spreadplayers ~ ~ 0 18 false @s
execute at @s if block ~ ~-1 ~ purpur_block unless entity @n[type=item_display,tag=gm4_ghef.sausage,tag=!gm4_ghef.sausage.picked_up,distance=..2] run return 1

scoreboard players remove $attempts gm4_ghef_data 1
execute if score $attempts gm4_ghef_data matches 0 run kill @s
execute if score $attempts gm4_ghef_data matches 1.. run function gm4_ghef:object/sausage/find_location
