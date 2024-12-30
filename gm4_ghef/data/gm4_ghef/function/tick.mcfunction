schedule function gm4_ghef:tick 1t

# | Players
execute as @a[tag=!gm4_ghef.dev,gamemode=spectator] run function gm4_ghef:player/process

# | Obstacles
# rats
#execute as @e[type=item_display,tag=gm4_ghef.rat] at @s run function gm4_ghef:object/rat/process

# | Music
execute store result score $worldborder gm4_ghef_data run worldborder get
execute if score $worldborder gm4_ghef_data matches 40870000.. as @a at @s run function gm4_ghef:music
