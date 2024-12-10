
execute as @e[type=item_display,tag=gm4_ghef.delivery] run data modify entity @s item.components."minecraft:item_model" set value "ghef:delivery_no_plate"
execute as @e[type=item_display,tag=gm4_ghef.delivery] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_gray_glazed_terracotta replace blue_glazed_terracotta
tag @e[type=item_display,tag=gm4_ghef.delivery.on] remove gm4_ghef.delivery.on

tag @e[type=item_display,tag=gm4_ghef.delivery,limit=3,sort=random] add gm4_ghef.delivery.on

execute as @e[type=item_display,tag=gm4_ghef.delivery.on] run data modify entity @s item.components."minecraft:item_model" set value "ghef:delivery"
execute as @e[type=item_display,tag=gm4_ghef.delivery.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ blue_glazed_terracotta replace light_gray_glazed_terracotta
