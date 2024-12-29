schedule function gm4_ghef:tick 1t

# | Players
execute as @a[tag=!gm4_ghef.dev,gamemode=spectator] run function gm4_ghef:player/process

# | Obstacles
# rats
#execute as @e[type=item_display,tag=gm4_ghef.rat] at @s run function gm4_ghef:object/rat/process

