
schedule function gm4_ghef:tick 1t

scoreboard objectives add gm4_ghef_data dummy
# friction
scoreboard players set $friction_x100 gm4_ghef_data -10
scoreboard players set $gravity_x1 gm4_ghef_data -8
scoreboard players set $bounce_percent.y gm4_ghef_data 20
scoreboard players set $bounce_percent.xz gm4_ghef_data 80
scoreboard players set $bounce_cutoff_speed gm4_ghef_data -32
scoreboard players set $rolling_resistance_percentage gm4_ghef_data 10

scoreboard players set #-1 gm4_ghef_data -1
scoreboard players set #0 gm4_ghef_data 0
scoreboard players set #2 gm4_ghef_data 2
scoreboard players set #100 gm4_ghef_data 100
scoreboard players set #1000 gm4_ghef_data 1000
scoreboard players set #-1000 gm4_ghef_data 1000
scoreboard players set #10000 gm4_ghef_data 10000
scoreboard players set #3600 gm4_ghef_data 3600
scoreboard players set #RAD2DEG gm4_ghef_data 57296
scoreboard players set #DEG2RAD gm4_ghef_data 17

scoreboard players set $m.m00 gm4_ghef_data 1000
scoreboard players set $m.m11 gm4_ghef_data 1000
scoreboard players set $m.m22 gm4_ghef_data 1000

scoreboard objectives add gm4_ghef.acceleration.x dummy
scoreboard objectives add gm4_ghef.acceleration.y dummy
scoreboard objectives add gm4_ghef.acceleration.z dummy

scoreboard objectives add gm4_ghef.velocity.x dummy
scoreboard objectives add gm4_ghef.velocity.y dummy
scoreboard objectives add gm4_ghef.velocity.z dummy

forceload add 0 0
summon item_display 0. 0 0. {UUID:[I;0,0,0,0]}
kill @e[type=marker,tag=gm4_ghef.compute]
summon marker 0.0 0.0 0.0 {Tags:["gm4_ghef.compute"]}

tellraw @a {"color":"aqua","text":"Ghef is ready to roll!"}

# You are Ghef, the sausage cooking Golf Chef!
# Move around the kitchen to collect sausages, boil them, and deliver them to hungry 
# customers, but be careful! Banana peels, rats and wet floors will make moving around
# a challenge. Try to deliver as many sausages before the timer runs out!

## TODO LIST (in order of importance):
# golf club spawning / despawning and input - movement of Ghef, use the new predicate

# mark player in spectator as player automatically

# sausage spawning system

# furnace timed sausage cooking

# sausage delivery location

# banana peel spawning and effects - should randomize your movement when hit
# rat spawning, movement and effects - moves and turns on a wall, kills the ball when hit
# mop bucket spawning and effects - acts as a full block
# wet floor spawning and effects - puddle should grow and the wet floor sign falls from the sky, puddle removes / reduces friction

# failure state - timer? just hitting a rat?

# allow for different Ghef's with different stats

# improve the camera system
