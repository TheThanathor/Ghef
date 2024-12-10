
execute as @e[type=item_display,tag=gm4_ghef.stove] run data modify entity @s item.components."minecraft:item_model" set value "ghef:stove_no_pot"
execute as @e[type=item_display,tag=gm4_ghef.stove] at @s run fill ~ ~-1 ~ ~ ~-1 ~ cyan_glazed_terracotta replace light_blue_glazed_terracotta
tag @e[type=item_display,tag=gm4_ghef.stove.on] remove gm4_ghef.stove.on

tag @e[type=item_display,tag=gm4_ghef.stove,limit=4,sort=random] add gm4_ghef.stove.on

execute as @e[type=item_display,tag=gm4_ghef.stove.on] run data modify entity @s item.components."minecraft:item_model" set value "ghef:stove"
execute as @e[type=item_display,tag=gm4_ghef.stove.on] at @s run fill ~ ~-1 ~ ~ ~-1 ~ light_blue_glazed_terracotta replace cyan_glazed_terracotta
