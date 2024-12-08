
# Inputs: vx, vz, distance, diameter
# vx, vz is the velocity, scaled
# distance is the distance rolled (in blocks, scaled)
# diameter is the diameter of the ball rolling (in blocks, scaled)

#tellraw @a ["old matrix\n", {"score": {"name": "$m.m00", "objective": "gm4_ghef_data"}},", ", {"score": {"name": "$m.m01", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m02", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.m10", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m11", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m12", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.m20", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m21", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m22", "objective": "gm4_ghef_data"}}]

## Compute axis-angle matrix

# Run axis-angle matrix calculation
$function gm4_ghef:physics/rolling/compute_axis_angle_matrix {vx: $(vx), vz: $(vz), distance: $(distance), diameter: $(diameter)}

## Multiply stored matrix with new matrix

# Calculate products
# First row's products
scoreboard players operation $m.a00m00 gm4_ghef_data = $m.a00 gm4_ghef_data
scoreboard players operation $m.a00m00 gm4_ghef_data *= $m.m00 gm4_ghef_data
scoreboard players operation $m.a00m00 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a00m01 gm4_ghef_data = $m.a00 gm4_ghef_data
scoreboard players operation $m.a00m01 gm4_ghef_data *= $m.m01 gm4_ghef_data
scoreboard players operation $m.a00m01 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a00m02 gm4_ghef_data = $m.a00 gm4_ghef_data
scoreboard players operation $m.a00m02 gm4_ghef_data *= $m.m02 gm4_ghef_data
scoreboard players operation $m.a00m02 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a01m10 gm4_ghef_data = $m.a01 gm4_ghef_data
scoreboard players operation $m.a01m10 gm4_ghef_data *= $m.m10 gm4_ghef_data
scoreboard players operation $m.a01m10 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a01m11 gm4_ghef_data = $m.a01 gm4_ghef_data
scoreboard players operation $m.a01m11 gm4_ghef_data *= $m.m11 gm4_ghef_data
scoreboard players operation $m.a01m11 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a01m12 gm4_ghef_data = $m.a01 gm4_ghef_data
scoreboard players operation $m.a01m12 gm4_ghef_data *= $m.m12 gm4_ghef_data
scoreboard players operation $m.a01m12 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a02m20 gm4_ghef_data = $m.a02 gm4_ghef_data
scoreboard players operation $m.a02m20 gm4_ghef_data *= $m.m20 gm4_ghef_data
scoreboard players operation $m.a02m20 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a02m21 gm4_ghef_data = $m.a02 gm4_ghef_data
scoreboard players operation $m.a02m21 gm4_ghef_data *= $m.m21 gm4_ghef_data
scoreboard players operation $m.a02m21 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a02m22 gm4_ghef_data = $m.a02 gm4_ghef_data
scoreboard players operation $m.a02m22 gm4_ghef_data *= $m.m22 gm4_ghef_data
scoreboard players operation $m.a02m22 gm4_ghef_data /= #1000 gm4_ghef_data

# Second row's products
scoreboard players operation $m.a10m00 gm4_ghef_data = $m.a10 gm4_ghef_data
scoreboard players operation $m.a10m00 gm4_ghef_data *= $m.m00 gm4_ghef_data
scoreboard players operation $m.a10m00 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a10m01 gm4_ghef_data = $m.a10 gm4_ghef_data
scoreboard players operation $m.a10m01 gm4_ghef_data *= $m.m01 gm4_ghef_data
scoreboard players operation $m.a10m01 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a10m02 gm4_ghef_data = $m.a10 gm4_ghef_data
scoreboard players operation $m.a10m02 gm4_ghef_data *= $m.m02 gm4_ghef_data
scoreboard players operation $m.a10m02 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a11m10 gm4_ghef_data = $m.a11 gm4_ghef_data
scoreboard players operation $m.a11m10 gm4_ghef_data *= $m.m10 gm4_ghef_data
scoreboard players operation $m.a11m10 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a11m11 gm4_ghef_data = $m.a11 gm4_ghef_data
scoreboard players operation $m.a11m11 gm4_ghef_data *= $m.m11 gm4_ghef_data
scoreboard players operation $m.a11m11 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a11m12 gm4_ghef_data = $m.a11 gm4_ghef_data
scoreboard players operation $m.a11m12 gm4_ghef_data *= $m.m12 gm4_ghef_data
scoreboard players operation $m.a11m12 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a12m20 gm4_ghef_data = $m.a12 gm4_ghef_data
scoreboard players operation $m.a12m20 gm4_ghef_data *= $m.m20 gm4_ghef_data
scoreboard players operation $m.a12m20 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a12m21 gm4_ghef_data = $m.a12 gm4_ghef_data
scoreboard players operation $m.a12m21 gm4_ghef_data *= $m.m21 gm4_ghef_data
scoreboard players operation $m.a12m21 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a12m22 gm4_ghef_data = $m.a12 gm4_ghef_data
scoreboard players operation $m.a12m22 gm4_ghef_data *= $m.m22 gm4_ghef_data
scoreboard players operation $m.a12m22 gm4_ghef_data /= #1000 gm4_ghef_data

# Third row's products
scoreboard players operation $m.a20m00 gm4_ghef_data = $m.a20 gm4_ghef_data
scoreboard players operation $m.a20m00 gm4_ghef_data *= $m.m00 gm4_ghef_data
scoreboard players operation $m.a20m00 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a20m01 gm4_ghef_data = $m.a20 gm4_ghef_data
scoreboard players operation $m.a20m01 gm4_ghef_data *= $m.m01 gm4_ghef_data
scoreboard players operation $m.a20m01 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a20m02 gm4_ghef_data = $m.a20 gm4_ghef_data
scoreboard players operation $m.a20m02 gm4_ghef_data *= $m.m02 gm4_ghef_data
scoreboard players operation $m.a20m02 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a21m10 gm4_ghef_data = $m.a21 gm4_ghef_data
scoreboard players operation $m.a21m10 gm4_ghef_data *= $m.m10 gm4_ghef_data
scoreboard players operation $m.a21m10 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a21m11 gm4_ghef_data = $m.a21 gm4_ghef_data
scoreboard players operation $m.a21m11 gm4_ghef_data *= $m.m11 gm4_ghef_data
scoreboard players operation $m.a21m11 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a21m12 gm4_ghef_data = $m.a21 gm4_ghef_data
scoreboard players operation $m.a21m12 gm4_ghef_data *= $m.m12 gm4_ghef_data
scoreboard players operation $m.a21m12 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a22m20 gm4_ghef_data = $m.a22 gm4_ghef_data
scoreboard players operation $m.a22m20 gm4_ghef_data *= $m.m20 gm4_ghef_data
scoreboard players operation $m.a22m20 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a22m21 gm4_ghef_data = $m.a22 gm4_ghef_data
scoreboard players operation $m.a22m21 gm4_ghef_data *= $m.m21 gm4_ghef_data
scoreboard players operation $m.a22m21 gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $m.a22m22 gm4_ghef_data = $m.a22 gm4_ghef_data
scoreboard players operation $m.a22m22 gm4_ghef_data *= $m.m22 gm4_ghef_data
scoreboard players operation $m.a22m22 gm4_ghef_data /= #1000 gm4_ghef_data

# Compute new matrix entries
# First row
scoreboard players operation $m.c00 gm4_ghef_data = $m.a00m00 gm4_ghef_data
scoreboard players operation $m.c00 gm4_ghef_data += $m.a01m10 gm4_ghef_data
scoreboard players operation $m.c00 gm4_ghef_data += $m.a02m20 gm4_ghef_data

scoreboard players operation $m.c01 gm4_ghef_data = $m.a00m01 gm4_ghef_data
scoreboard players operation $m.c01 gm4_ghef_data += $m.a01m11 gm4_ghef_data
scoreboard players operation $m.c01 gm4_ghef_data += $m.a02m21 gm4_ghef_data

scoreboard players operation $m.c02 gm4_ghef_data = $m.a00m02 gm4_ghef_data
scoreboard players operation $m.c02 gm4_ghef_data += $m.a01m12 gm4_ghef_data
scoreboard players operation $m.c02 gm4_ghef_data += $m.a02m22 gm4_ghef_data

# Second row
scoreboard players operation $m.c10 gm4_ghef_data = $m.a10m00 gm4_ghef_data
scoreboard players operation $m.c10 gm4_ghef_data += $m.a11m10 gm4_ghef_data
scoreboard players operation $m.c10 gm4_ghef_data += $m.a12m20 gm4_ghef_data

scoreboard players operation $m.c11 gm4_ghef_data = $m.a10m01 gm4_ghef_data
scoreboard players operation $m.c11 gm4_ghef_data += $m.a11m11 gm4_ghef_data
scoreboard players operation $m.c11 gm4_ghef_data += $m.a12m21 gm4_ghef_data

scoreboard players operation $m.c12 gm4_ghef_data = $m.a10m02 gm4_ghef_data
scoreboard players operation $m.c12 gm4_ghef_data += $m.a11m12 gm4_ghef_data
scoreboard players operation $m.c12 gm4_ghef_data += $m.a12m22 gm4_ghef_data

# Third row
scoreboard players operation $m.c20 gm4_ghef_data = $m.a20m00 gm4_ghef_data
scoreboard players operation $m.c20 gm4_ghef_data += $m.a21m10 gm4_ghef_data
scoreboard players operation $m.c20 gm4_ghef_data += $m.a22m20 gm4_ghef_data

scoreboard players operation $m.c21 gm4_ghef_data = $m.a20m01 gm4_ghef_data
scoreboard players operation $m.c21 gm4_ghef_data += $m.a21m11 gm4_ghef_data
scoreboard players operation $m.c21 gm4_ghef_data += $m.a22m21 gm4_ghef_data

scoreboard players operation $m.c22 gm4_ghef_data = $m.a20m02 gm4_ghef_data
scoreboard players operation $m.c22 gm4_ghef_data += $m.a21m12 gm4_ghef_data
scoreboard players operation $m.c22 gm4_ghef_data += $m.a22m22 gm4_ghef_data

## Replace stored matrix with new matrix

scoreboard players operation $m.m00 gm4_ghef_data = $m.c00 gm4_ghef_data
scoreboard players operation $m.m01 gm4_ghef_data = $m.c01 gm4_ghef_data
scoreboard players operation $m.m02 gm4_ghef_data = $m.c02 gm4_ghef_data

scoreboard players operation $m.m10 gm4_ghef_data = $m.c10 gm4_ghef_data
scoreboard players operation $m.m11 gm4_ghef_data = $m.c11 gm4_ghef_data
scoreboard players operation $m.m12 gm4_ghef_data = $m.c12 gm4_ghef_data

scoreboard players operation $m.m20 gm4_ghef_data = $m.c20 gm4_ghef_data
scoreboard players operation $m.m21 gm4_ghef_data = $m.c21 gm4_ghef_data
scoreboard players operation $m.m22 gm4_ghef_data = $m.c22 gm4_ghef_data

execute store result storage gm4_ghef:temp matrix.m00 float 0.003 run scoreboard players get $m.m00 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m01 float 0.001 run scoreboard players get $m.m01 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m02 float 0.001 run scoreboard players get $m.m02 gm4_ghef_data

execute store result storage gm4_ghef:temp matrix.m10 float 0.001 run scoreboard players get $m.m10 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m11 float 0.003 run scoreboard players get $m.m11 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m12 float 0.001 run scoreboard players get $m.m12 gm4_ghef_data

execute store result storage gm4_ghef:temp matrix.m20 float 0.001 run scoreboard players get $m.m20 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m21 float 0.001 run scoreboard players get $m.m21 gm4_ghef_data
execute store result storage gm4_ghef:temp matrix.m22 float 0.003 run scoreboard players get $m.m22 gm4_ghef_data

function gm4_ghef:physics/rolling/apply_matrix with storage gm4_ghef:temp matrix 
data remove storage gm4_ghef:temp matrix

#tellraw @a ["new matrix\n", {"score": {"name": "$m.m00", "objective": "gm4_ghef_data"}},", ", {"score": {"name": "$m.m01", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m02", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.m10", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m11", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m12", "objective": "gm4_ghef_data"}}, "\n", {"score": {"name": "$m.m20", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m21", "objective": "gm4_ghef_data"}}, ", ", {"score": {"name": "$m.m22", "objective": "gm4_ghef_data"}}]
