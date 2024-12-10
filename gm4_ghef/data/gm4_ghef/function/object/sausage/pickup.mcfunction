
scoreboard players set $stage gm4_ghef_data 2

execute at @s run playsound minecraft:entity.item.pickup master @a ~ ~ ~ 1 1
ride @s mount @n[type=item_display,tag=gm4_ghef.main]
data modify entity @s transformation.translation[1] set value 0.8f
tag @s add gm4_ghef.sausage.picked_up
