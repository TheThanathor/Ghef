
tag @s add gm4_ghef.sausage.cooked
data modify entity @s item.components."minecraft:item_model" set value "ghef:sausage"
execute at @s run playsound block.fire.extinguish master @a ~ ~ ~ 1 1
