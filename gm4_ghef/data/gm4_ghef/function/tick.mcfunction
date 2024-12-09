schedule function gm4_ghef:tick 1t

# we do not run anything if the club is hitting the ball!
execute if score $club_moving gm4_ghef_data matches 1 run return 0

# player
execute as @p[tag=gm4_ghef.player] run function gm4_ghef:player/process

# ghef
execute as @n[type=item_display,tag=gm4_ghef.main] at @s run function gm4_ghef:physics/process

# move camera (this will also move the club)
execute store result storage gm4_ghef:temp club.angle int 1 run scoreboard players get $club_angle gm4_ghef_data
function gm4_ghef:club/set with storage gm4_ghef:temp club
data remove storage gm4_ghef:temp club
