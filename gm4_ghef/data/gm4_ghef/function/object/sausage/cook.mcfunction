
scoreboard players set $stage gm4_ghef_data 3

tag @s add gm4_ghef.sausage.cooked
data modify entity @s item.components."minecraft:item_model" set value "ghef:sausage_cooked"
execute at @s run playsound block.fire.extinguish master @a ~ ~ ~ 1 1
