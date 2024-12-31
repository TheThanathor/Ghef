
# Inputs: vx, vz, distance, diameter
# vx, vz is the velocity, scaled
# distance is the distance rolled (in blocks, scaled)
# diameter is the diameter of the ball rolling (in blocks, scaled)

## Calculate correct cross product vector

$scoreboard players set $m.vx gm4_ghef_data $(vz)
scoreboard players set $m.vy gm4_ghef_data 0
$scoreboard players set $m.vz gm4_ghef_data $(vx)

scoreboard players operation $m.vx gm4_ghef_data *= #-1 gm4_ghef_data

## Normalize velocity vector

# Compute velocity magnitude
execute store result storage gm4_ghef:temp mag.x float 0.001 run scoreboard players get $m.vx gm4_ghef_data
execute store result storage gm4_ghef:temp mag.y float 0.001 run scoreboard players get $m.vy gm4_ghef_data
execute store result storage gm4_ghef:temp mag.z float 0.001 run scoreboard players get $m.vz gm4_ghef_data
function gm4_ghef:physics/rolling/compute_magnitude with storage gm4_ghef:temp mag
data remove storage gm4_ghef:temp mag

#tellraw @a ["bef ", {"score": {"name": "$m.vx", "objective": "gm4_ghef_data"}},", ", {"score": {"name": "$m.vz", "objective": "gm4_ghef_data"}},", ", {"score": {"name": "$magnitude", "objective": "gm4_ghef_data"}}]

scoreboard players add $magnitude gm4_ghef_data 1

# Normalize components
scoreboard players operation $m.vx gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vx gm4_ghef_data /= $magnitude gm4_ghef_data

scoreboard players operation $m.vy gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vy gm4_ghef_data /= $magnitude gm4_ghef_data

scoreboard players operation $m.vz gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vz gm4_ghef_data /= $magnitude gm4_ghef_data

## Compute roll angle from distance and diameter

# Compute the roll angle, s = ad/2 => a = 2s/d
$scoreboard players set $m.rangle gm4_ghef_data $(distance)
$scoreboard players set $m.t0 gm4_ghef_data $(diameter)
scoreboard players operation $m.rangle gm4_ghef_data += $m.rangle gm4_ghef_data
scoreboard players operation $m.rangle gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.rangle gm4_ghef_data /= $m.t0 gm4_ghef_data

# Convert from radians to degrees
scoreboard players operation $m.rangle gm4_ghef_data *= #RAD2DEG gm4_ghef_data
scoreboard players operation $m.rangle gm4_ghef_data /= #-1000 gm4_ghef_data

## Compute sin and cosines of roll angle

# Angle is halved here to compute sin(a/2) and cos(a/2) for the quaternion.
execute store result storage gm4_ghef:temp sincos.angle float 0.0005 run scoreboard players get $m.rangle gm4_ghef_data
function gm4_ghef:physics/rolling/compute_sincos with storage gm4_ghef:temp sincos
data remove storage gm4_ghef:temp sincos

## Compute rotation quaternion

scoreboard players operation $q.ax gm4_ghef_data = $m.vx gm4_ghef_data
scoreboard players operation $q.ax gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $q.ax gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ay gm4_ghef_data = $m.vy gm4_ghef_data
scoreboard players operation $q.ay gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $q.ay gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.az gm4_ghef_data = $m.vz gm4_ghef_data
scoreboard players operation $q.az gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $q.az gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.aw gm4_ghef_data = $m.cos gm4_ghef_data