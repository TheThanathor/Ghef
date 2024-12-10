
scoreboard players set $club_moving gm4_ghef_data 1

scoreboard players set $club_power_direction gm4_ghef_data 1
scoreboard players set $club_power_add gm4_ghef_data 0
scoreboard players set $club_power_add_timer gm4_ghef_data 0

execute at @n[type=item_display,tag=gm4_ghef.main] run summon marker ~ ~ ~ {Tags:["gm4_ghef.saved_location"]}

# translate hit to velocity
execute store result storage gm4_ghef:temp hit.speed float 77 run scoreboard players get $club_power gm4_ghef_data
execute positioned as @n[type=item_display,tag=gm4_ghef.main] rotated ~ 0 summon marker run function gm4_ghef:club/get_power with storage gm4_ghef:temp hit
data remove storage gm4_ghef:temp hit
scoreboard players reset $club_power gm4_ghef_data

execute store result score $deduct.x gm4_ghef_data run data get entity @n[type=item_display,tag=gm4_ghef.main] Pos[0] 10
execute store result score $deduct.z gm4_ghef_data run data get entity @n[type=item_display,tag=gm4_ghef.main] Pos[2] 10

scoreboard players operation $velocity.x gm4_ghef_data -= $deduct.x gm4_ghef_data
scoreboard players operation $velocity.z gm4_ghef_data -= $deduct.z gm4_ghef_data

execute as @n[type=item_display,tag=gm4_ghef.club] at @s run tp @s ~ ~ ~ ~ 16

schedule function gm4_ghef:club/hit 2t
