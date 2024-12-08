
# Inputs: vx, vy, vz, distance, diameter
# vx, vy, vz is the velocity, scaled
# distance is the distance rolled (in blocks, scaled)
# diameter is the diameter of the ball rolling (in blocks, scaled)

## TODO: Calculate cross product vector for rotation

## Normalize velocity vector

# Compute velocity magnitude
$scoreboard players set $m.vx gm4_ghef_data $(vx)
$scoreboard players set $m.vy gm4_ghef_data $(vy)
$scoreboard players set $m.vz gm4_ghef_data $(vz)

execute store result storage gm4_ghef:temp mag.x float 0.001 run scoreboard players get $m.vx gm4_ghef_data
execute store result storage gm4_ghef:temp mag.y float 0.001 run scoreboard players get $m.vy gm4_ghef_data
execute store result storage gm4_ghef:temp mag.z float 0.001 run scoreboard players get $m.vz gm4_ghef_data
function gm4_ghef:physics/rolling/compute_magnitude with storage gm4_ghef:temp mag
data remove storage gm4_ghef:temp mag

# Normalize components
scoreboard players operation $m.vx gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vx gm4_ghef_data /= $magnitude gm4_ghef_data

scoreboard players operation $m.vy gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vy gm4_ghef_data /= $magnitude gm4_ghef_data

scoreboard players operation $m.vz gm4_ghef_data *= #1000 gm4_ghef_data
scoreboard players operation $m.vz gm4_ghef_data /= $magnitude gm4_ghef_data

## Compute velocity products for axis-angle matrix

# Compute squared components
scoreboard players operation $m.vx2 gm4_ghef_data = $m.vx gm4_ghef_data
scoreboard players operation $m.vx2 gm4_ghef_data *= $m.vx gm4_ghef_data
scoreboard players operation $m.vx2 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.vy2 gm4_ghef_data = $m.vy gm4_ghef_data
scoreboard players operation $m.vy2 gm4_ghef_data *= $m.vy gm4_ghef_data
scoreboard players operation $m.vy2 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.vz2 gm4_ghef_data = $m.vz gm4_ghef_data
scoreboard players operation $m.vz2 gm4_ghef_data *= $m.vz gm4_ghef_data
scoreboard players operation $m.vz2 gm4_ghef_data /= #1000 gm4_ghef_data

# Compute combinations
scoreboard players operation $m.vxvy gm4_ghef_data = $m.vx gm4_ghef_data
scoreboard players operation $m.vxvy gm4_ghef_data *= $m.vy gm4_ghef_data
scoreboard players operation $m.vxvy gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.vxvz gm4_ghef_data = $m.vx gm4_ghef_data
scoreboard players operation $m.vxvz gm4_ghef_data *= $m.vz gm4_ghef_data
scoreboard players operation $m.vxvz gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.vyvz gm4_ghef_data = $m.vy gm4_ghef_data
scoreboard players operation $m.vyvz gm4_ghef_data *= $m.vz gm4_ghef_data
scoreboard players operation $m.vyvz gm4_ghef_data /= #1000 gm4_ghef_data

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

execute store result storage gm4_ghef:temp sincos.angle float 0.001 run scoreboard players get $m.rangle gm4_ghef_data
function gm4_ghef:physics/rolling/compute_sincos with storage gm4_ghef:temp sincos
data remove storage gm4_ghef:temp sincos

# Calculate 1 - cos(a) (used commonly in calculations)
scoreboard players set $m.icos gm4_ghef_data 1000
scoreboard players operation $m.icos gm4_ghef_data -= $m.cos gm4_ghef_data

## Compute axis-angle matrix

# Calculate repeated terms for re-use
# vx vy (1 - cos)
scoreboard players operation $m.t0 gm4_ghef_data = $m.vxvy gm4_ghef_data
scoreboard players operation $m.t0 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.t0 gm4_ghef_data /= #1000 gm4_ghef_data

# vx vz (1 - cos)
scoreboard players operation $m.t1 gm4_ghef_data = $m.vxvz gm4_ghef_data
scoreboard players operation $m.t1 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.t1 gm4_ghef_data /= #1000 gm4_ghef_data

# vy vz (1 - cos)
scoreboard players operation $m.t2 gm4_ghef_data = $m.vyvz gm4_ghef_data
scoreboard players operation $m.t2 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.t2 gm4_ghef_data /= #1000 gm4_ghef_data

# vx sin
scoreboard players operation $m.t3 gm4_ghef_data = $m.vx gm4_ghef_data
scoreboard players operation $m.t3 gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $m.t3 gm4_ghef_data /= #1000 gm4_ghef_data

# vy sin
scoreboard players operation $m.t4 gm4_ghef_data = $m.vy gm4_ghef_data
scoreboard players operation $m.t4 gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $m.t4 gm4_ghef_data /= #1000 gm4_ghef_data

# vz sin
scoreboard players operation $m.t5 gm4_ghef_data = $m.vz gm4_ghef_data
scoreboard players operation $m.t5 gm4_ghef_data *= $m.sin gm4_ghef_data
scoreboard players operation $m.t5 gm4_ghef_data /= #1000 gm4_ghef_data

# Calculate entries

# Diagonal entries
scoreboard players operation $m.a00 gm4_ghef_data = $m.vx2 gm4_ghef_data
scoreboard players operation $m.a00 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.a00 gm4_ghef_data /= #1000 gm4_ghef_data
scoreboard players operation $m.a00 gm4_ghef_data += $m.cos gm4_ghef_data

scoreboard players operation $m.a11 gm4_ghef_data = $m.vy2 gm4_ghef_data
scoreboard players operation $m.a11 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.a11 gm4_ghef_data /= #1000 gm4_ghef_data
scoreboard players operation $m.a11 gm4_ghef_data += $m.cos gm4_ghef_data

scoreboard players operation $m.a22 gm4_ghef_data = $m.vz2 gm4_ghef_data
scoreboard players operation $m.a22 gm4_ghef_data *= $m.icos gm4_ghef_data
scoreboard players operation $m.a22 gm4_ghef_data /= #1000 gm4_ghef_data
scoreboard players operation $m.a22 gm4_ghef_data += $m.cos gm4_ghef_data

# Off-Diagonal entries
scoreboard players operation $m.a01 gm4_ghef_data = $m.t0 gm4_ghef_data
scoreboard players operation $m.a01 gm4_ghef_data -= $m.t5 gm4_ghef_data

scoreboard players operation $m.a02 gm4_ghef_data = $m.t1 gm4_ghef_data
scoreboard players operation $m.a02 gm4_ghef_data += $m.t4 gm4_ghef_data

scoreboard players operation $m.a10 gm4_ghef_data = $m.t0 gm4_ghef_data
scoreboard players operation $m.a10 gm4_ghef_data += $m.t5 gm4_ghef_data

scoreboard players operation $m.a12 gm4_ghef_data = $m.t2 gm4_ghef_data
scoreboard players operation $m.a12 gm4_ghef_data -= $m.t3 gm4_ghef_data

scoreboard players operation $m.a20 gm4_ghef_data = $m.t1 gm4_ghef_data
scoreboard players operation $m.a20 gm4_ghef_data -= $m.t4 gm4_ghef_data

scoreboard players operation $m.a21 gm4_ghef_data = $m.t2 gm4_ghef_data
scoreboard players operation $m.a21 gm4_ghef_data += $m.t3 gm4_ghef_data

# tellraw @a [{"score": {"name": "$m.a00", "objective": "gm4_ghef_data"}},", ", {"score": {"name": "$m.a01", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.a02", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.a10", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.a11", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.a12", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.a20", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.a21", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.a22", "objective": "gm4_ghef_data"}}]