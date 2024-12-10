

execute store result score $randomize_x gm4_ghef_data run random value -75..75
scoreboard players operation @s gm4_ghef.velocity.x *= $randomize_x gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.x /= #100 gm4_ghef_data

execute store result score $randomize_z gm4_ghef_data run random value -75..75
scoreboard players operation @s gm4_ghef.velocity.z *= $randomize_z gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.z /= #100 gm4_ghef_data

execute at @n[type=item_display,tag=gm4_ghef.banana_peel] run playsound minecraft:block.wet_sponge.place master @a ~ ~ ~ 1 1
kill @n[type=item_display,tag=gm4_ghef.banana_peel]
