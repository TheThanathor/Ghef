
kill @n[type=marker,tag=gm4_ghef.saved_location]

execute unless score $strokes_left gm4_ghef_data matches 1.. run tellraw @a [{"text":"You ran out of Strokes! You delivered ","color":"red"},{"score":{"name":"$sausages_delivered","objective":"gm4_ghef_data"},"color":"white"},{"text":" sausages!"}]
execute unless score $strokes_left gm4_ghef_data matches 1.. at @s positioned ~ ~20 ~ run function gm4_ghef:setup/spawn_ghef

tag @s remove gm4_ghef.moving
scoreboard players set $ghef_moving gm4_ghef_data 0
scoreboard players set $club_power gm4_ghef_data 0

execute if score $spawn_obstacle_chance gm4_ghef_data matches ..189 run scoreboard players add $spawn_obstacle_chance gm4_ghef_data 1

function gm4_ghef:club/spawn

# spawn sausage if there are less than 2
execute store result score $sausage_count gm4_ghef_data if entity @e[type=item_display,tag=gm4_ghef.sausage]
execute if score $sausage_count gm4_ghef_data matches ..1 run function gm4_ghef:object/sausage/spawn

# obstacles should not exist for too long
scoreboard players add @e[type=item_display,tag=gm4_ghef.obstacle] gm4_ghef.obstacle_timer 1
execute as @e[type=item_display,tag=gm4_ghef.obstacle] if predicate {condition:"random_chance",chance:0.5} run scoreboard players add @s gm4_ghef.obstacle_timer 1
execute as @e[type=item_display,tag=gm4_ghef.mop_bucket,scores={gm4_ghef.obstacle_timer=30..}] at @s run fill ~ ~ ~ ~ ~ ~ air replace barrier
execute as @e[type=item_display,tag=gm4_ghef.puddle,scores={gm4_ghef.obstacle_timer=30..}] on passengers run kill @s
kill @e[type=item_display,tag=gm4_ghef.obstacle,scores={gm4_ghef.obstacle_timer=30..}]

# check if obstacles should spawn
execute store result score $spawn_obstacle_check gm4_ghef_data run random value 1..100
execute if score $spawn_obstacle_check gm4_ghef_data >= $spawn_obstacle_chance gm4_ghef_data run return 0

# pick randomly from obstacles
execute store result score $obstacle gm4_ghef_data run random value 1..100
# spawn picked obstacle(s)
execute if score $obstacle gm4_ghef_data matches 1..35 run function gm4_ghef:object/banana_peel/spawn
execute if score $obstacle gm4_ghef_data matches 36..65 run function gm4_ghef:object/puddle/spawn
execute if score $obstacle gm4_ghef_data matches 66..85 run function gm4_ghef:object/mop_bucket/spawn
execute if score $obstacle gm4_ghef_data matches 86..100 run function gm4_ghef:object/rat/spawn

# check if more obstacles should spawn
scoreboard players operation $spawn_obstacle_check gm4_ghef_data += $spawn_obstacle_check gm4_ghef_data
execute if score $spawn_obstacle_check gm4_ghef_data >= $spawn_obstacle_chance gm4_ghef_data run return 0

# pick randomly from obstacles
execute store result score $obstacle gm4_ghef_data run random value 1..100
# spawn picked obstacle(s)
execute if score $obstacle gm4_ghef_data matches 1..35 run function gm4_ghef:object/banana_peel/spawn
execute if score $obstacle gm4_ghef_data matches 36..65 run function gm4_ghef:object/puddle/spawn
execute if score $obstacle gm4_ghef_data matches 66..85 run function gm4_ghef:object/mop_bucket/spawn
execute if score $obstacle gm4_ghef_data matches 86..100 run function gm4_ghef:object/rat/spawn

# check if even more obstacles should spawn
scoreboard players operation $spawn_obstacle_check gm4_ghef_data += $spawn_obstacle_check gm4_ghef_data
execute if score $spawn_obstacle_check gm4_ghef_data >= $spawn_obstacle_chance gm4_ghef_data run return 0

# pick randomly from obstacles
execute store result score $obstacle gm4_ghef_data run random value 1..100
# spawn picked obstacle(s)
execute if score $obstacle gm4_ghef_data matches 1..35 run function gm4_ghef:object/banana_peel/spawn
execute if score $obstacle gm4_ghef_data matches 36..65 run function gm4_ghef:object/puddle/spawn
execute if score $obstacle gm4_ghef_data matches 66..85 run function gm4_ghef:object/mop_bucket/spawn
execute if score $obstacle gm4_ghef_data matches 86..100 run function gm4_ghef:object/rat/spawn
