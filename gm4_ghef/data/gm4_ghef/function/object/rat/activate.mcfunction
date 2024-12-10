
execute on passengers run kill @s[tag=gm4_ghef.sausage.picked_up]

scoreboard players set $stage gm4_ghef_data 1

execute store result score $reduce_velocity gm4_ghef_data run random value 25..50
scoreboard players operation @s gm4_ghef.velocity.x *= $reduce_velocity gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z *= $reduce_velocity gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z /= #100 gm4_ghef_data

execute at @n[type=item_display,tag=gm4_ghef.rat] run playsound minecraft:entity.silverfish.death master @a ~ ~ ~ 1 1
kill @n[type=item_display,tag=gm4_ghef.rat]
