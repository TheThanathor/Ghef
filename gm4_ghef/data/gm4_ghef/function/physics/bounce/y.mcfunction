
scoreboard players set @s gm4_ghef.acceleration.y 0

scoreboard players operation @s gm4_ghef.velocity.y *= $bounce_percent.y gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.y /= #100 gm4_ghef_data
scoreboard players operation @s gm4_ghef.velocity.y *= #-1 gm4_ghef_data
