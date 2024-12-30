
# use worldborder as a timer
worldborder set 40000000
worldborder set 50000000 100

# play the main theme
execute if predicate {condition:"random_chance",chance:0.9} run playsound ghef:main_piano voice @s ~ ~ ~ 1 1 1
playsound ghef:main_drum voice @s ~ ~ ~ 1 1 1
execute if predicate {condition:"random_chance",chance:0.75} run playsound ghef:main_bass voice @s ~ ~ ~ 1 1 1
execute if predicate {condition:"random_chance",chance:0.66} run playsound ghef:main_pad voice @s ~ ~ ~ 1 1 1

# pick random melodies
scoreboard players add $melody_timer gm4_ghef_jukebox 1
execute if score $melody_timer gm4_ghef_jukebox matches 4.. if predicate {condition:"random_chance",chance:0.8} run scoreboard players set $melody_timer gm4_ghef_jukebox 1
execute if score $melody_timer gm4_ghef_jukebox matches 5.. run scoreboard players set $melody_timer gm4_ghef_jukebox 0

execute if score $melody_timer gm4_ghef_jukebox matches 2 store result score $melody_picked gm4_ghef_jukebox run random value 1..2
execute if score $melody_timer gm4_ghef_jukebox matches 2.. if score $melody_picked gm4_ghef_jukebox matches 1 run playsound ghef:melody_guitar voice @s ~ ~ ~ 1 1 1
execute if score $melody_timer gm4_ghef_jukebox matches 2.. if score $melody_picked gm4_ghef_jukebox matches 2 run playsound ghef:melody_marimba voice @s ~ ~ ~ 1 1 1
