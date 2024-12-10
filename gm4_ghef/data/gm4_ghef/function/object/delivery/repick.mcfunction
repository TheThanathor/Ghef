
execute as @e[type=item_display,tag=gm4_ghef.delivery] run data modify entity @s item.components."minecraft:item_model" set value "ghef:delivery_no_plate"
execute as @e[type=item_display,tag=gm4_ghef.delivery] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_gray_glazed_terracotta[facing=north] replace blue_glazed_terracotta[facing=north]
execute as @e[type=item_display,tag=gm4_ghef.delivery] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_gray_glazed_terracotta[facing=east] replace blue_glazed_terracotta[facing=east]
execute as @e[type=item_display,tag=gm4_ghef.delivery] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_gray_glazed_terracotta[facing=south] replace blue_glazed_terracotta[facing=south]
execute as @e[type=item_display,tag=gm4_ghef.delivery] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_gray_glazed_terracotta[facing=west] replace blue_glazed_terracotta[facing=west]
tag @e[type=item_display,tag=gm4_ghef.delivery.on] remove gm4_ghef.delivery.on

tag @e[type=item_display,tag=gm4_ghef.delivery,limit=3,sort=random] add gm4_ghef.delivery.on

execute as @e[type=item_display,tag=gm4_ghef.delivery.on] run data modify entity @s item.components."minecraft:item_model" set value "ghef:delivery"
execute as @e[type=item_display,tag=gm4_ghef.delivery.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ blue_glazed_terracotta[facing=north] replace light_gray_glazed_terracotta[facing=north]
execute as @e[type=item_display,tag=gm4_ghef.delivery.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ blue_glazed_terracotta[facing=east] replace light_gray_glazed_terracotta[facing=east]
execute as @e[type=item_display,tag=gm4_ghef.delivery.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ blue_glazed_terracotta[facing=south] replace light_gray_glazed_terracotta[facing=south]
execute as @e[type=item_display,tag=gm4_ghef.delivery.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ blue_glazed_terracotta[facing=west] replace light_gray_glazed_terracotta[facing=west]
