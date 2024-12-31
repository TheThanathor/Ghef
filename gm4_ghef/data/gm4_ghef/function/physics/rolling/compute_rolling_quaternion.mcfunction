# Inputs: vx, vz, distance, diameter
# vx, vz is the velocity, scaled
# distance is the distance rolled (in blocks, scaled)
# diameter is the diameter of the ball rolling (in blocks, scaled)

## Compute axis-angle quaternion

execute store result score $q.mx gm4_ghef_data run data get entity @s transformation.right_rotation[0] 1000
execute store result score $q.my gm4_ghef_data run data get entity @s transformation.right_rotation[1] 1000
execute store result score $q.mz gm4_ghef_data run data get entity @s transformation.right_rotation[2] 1000
execute store result score $q.mw gm4_ghef_data run data get entity @s transformation.right_rotation[3] 1000

# Run axis-angle quaternion calculation
$function gm4_ghef:physics/rolling/compute_axis_angle_quaternion {vx: $(vx), vz: $(vz), distance: $(distance), diameter: $(diameter)}

## Multiply stored quaternion with new quaternion (q_new = q_axis * q_old)

# Calculate all products

# aw * m[]
scoreboard players operation $q.aw_mx gm4_ghef_data = $q.aw gm4_ghef_data
scoreboard players operation $q.aw_mx gm4_ghef_data *= $q.mx gm4_ghef_data
scoreboard players operation $q.aw_mx gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.aw_my gm4_ghef_data = $q.aw gm4_ghef_data
scoreboard players operation $q.aw_my gm4_ghef_data *= $q.my gm4_ghef_data
scoreboard players operation $q.aw_my gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.aw_mz gm4_ghef_data = $q.aw gm4_ghef_data
scoreboard players operation $q.aw_mz gm4_ghef_data *= $q.mz gm4_ghef_data
scoreboard players operation $q.aw_mz gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.aw_mw gm4_ghef_data = $q.aw gm4_ghef_data
scoreboard players operation $q.aw_mw gm4_ghef_data *= $q.mw gm4_ghef_data
scoreboard players operation $q.aw_mw gm4_ghef_data /= #1000 gm4_ghef_data

# ax * m[]
scoreboard players operation $q.ax_mx gm4_ghef_data = $q.ax gm4_ghef_data
scoreboard players operation $q.ax_mx gm4_ghef_data *= $q.mx gm4_ghef_data
scoreboard players operation $q.ax_mx gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ax_my gm4_ghef_data = $q.ax gm4_ghef_data
scoreboard players operation $q.ax_my gm4_ghef_data *= $q.my gm4_ghef_data
scoreboard players operation $q.ax_my gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ax_mz gm4_ghef_data = $q.ax gm4_ghef_data
scoreboard players operation $q.ax_mz gm4_ghef_data *= $q.mz gm4_ghef_data
scoreboard players operation $q.ax_mz gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ax_mw gm4_ghef_data = $q.ax gm4_ghef_data
scoreboard players operation $q.ax_mw gm4_ghef_data *= $q.mw gm4_ghef_data
scoreboard players operation $q.ax_mw gm4_ghef_data /= #1000 gm4_ghef_data

# ay * m[]
scoreboard players operation $q.ay_mx gm4_ghef_data = $q.ay gm4_ghef_data
scoreboard players operation $q.ay_mx gm4_ghef_data *= $q.mx gm4_ghef_data
scoreboard players operation $q.ay_mx gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ay_my gm4_ghef_data = $q.ay gm4_ghef_data
scoreboard players operation $q.ay_my gm4_ghef_data *= $q.my gm4_ghef_data
scoreboard players operation $q.ay_my gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ay_mz gm4_ghef_data = $q.ay gm4_ghef_data
scoreboard players operation $q.ay_mz gm4_ghef_data *= $q.mz gm4_ghef_data
scoreboard players operation $q.ay_mz gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.ay_mw gm4_ghef_data = $q.ay gm4_ghef_data
scoreboard players operation $q.ay_mw gm4_ghef_data *= $q.mw gm4_ghef_data
scoreboard players operation $q.ay_mw gm4_ghef_data /= #1000 gm4_ghef_data

# az * m[]
scoreboard players operation $q.az_mx gm4_ghef_data = $q.az gm4_ghef_data
scoreboard players operation $q.az_mx gm4_ghef_data *= $q.mx gm4_ghef_data
scoreboard players operation $q.az_mx gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.az_my gm4_ghef_data = $q.az gm4_ghef_data
scoreboard players operation $q.az_my gm4_ghef_data *= $q.my gm4_ghef_data
scoreboard players operation $q.az_my gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.az_mz gm4_ghef_data = $q.az gm4_ghef_data
scoreboard players operation $q.az_mz gm4_ghef_data *= $q.mz gm4_ghef_data
scoreboard players operation $q.az_mz gm4_ghef_data /= #1000 gm4_ghef_data

scoreboard players operation $q.az_mw gm4_ghef_data = $q.az gm4_ghef_data
scoreboard players operation $q.az_mw gm4_ghef_data *= $q.mw gm4_ghef_data
scoreboard players operation $q.az_mw gm4_ghef_data /= #1000 gm4_ghef_data

# Compute new quaternion

scoreboard players operation $q.rw gm4_ghef_data = $q.aw_mw gm4_ghef_data
scoreboard players operation $q.rw gm4_ghef_data -= $q.ax_mx gm4_ghef_data
scoreboard players operation $q.rw gm4_ghef_data -= $q.ay_my gm4_ghef_data
scoreboard players operation $q.rw gm4_ghef_data -= $q.az_mz gm4_ghef_data

scoreboard players operation $q.rx gm4_ghef_data = $q.aw_mx gm4_ghef_data
scoreboard players operation $q.rx gm4_ghef_data += $q.ax_mw gm4_ghef_data
scoreboard players operation $q.rx gm4_ghef_data += $q.ay_mz gm4_ghef_data
scoreboard players operation $q.rx gm4_ghef_data -= $q.az_my gm4_ghef_data

scoreboard players operation $q.ry gm4_ghef_data = $q.aw_my gm4_ghef_data
scoreboard players operation $q.ry gm4_ghef_data -= $q.ax_mz gm4_ghef_data
scoreboard players operation $q.ry gm4_ghef_data += $q.ay_mw gm4_ghef_data
scoreboard players operation $q.ry gm4_ghef_data += $q.az_mx gm4_ghef_data

scoreboard players operation $q.rz gm4_ghef_data = $q.aw_mz gm4_ghef_data
scoreboard players operation $q.rz gm4_ghef_data += $q.ax_my gm4_ghef_data
scoreboard players operation $q.rz gm4_ghef_data -= $q.ay_mx gm4_ghef_data
scoreboard players operation $q.rz gm4_ghef_data += $q.az_mw gm4_ghef_data

# Apply the new rotation to Ghef and update the internal storage

data modify storage gm4_ghef:temp quat set value [0.0f,0.0f,0.0f,1.0f]
execute store result storage gm4_ghef:temp quat[0] float 0.001 run scoreboard players get $q.rx gm4_ghef_data
execute store result storage gm4_ghef:temp quat[1] float 0.001 run scoreboard players get $q.ry gm4_ghef_data
execute store result storage gm4_ghef:temp quat[2] float 0.001 run scoreboard players get $q.rz gm4_ghef_data
execute store result storage gm4_ghef:temp quat[3] float 0.001 run scoreboard players get $q.rw gm4_ghef_data

data modify entity @s transformation.right_rotation set from storage gm4_ghef:temp quat
data modify entity @s interpolation_duration set value 1
data modify entity @s start_interpolation set value -1

execute store result score $q.mx gm4_ghef_data run data get entity @s transformation.right_rotation[0] 1000
execute store result score $q.my gm4_ghef_data run data get entity @s transformation.right_rotation[1] 1000
execute store result score $q.mz gm4_ghef_data run data get entity @s transformation.right_rotation[2] 1000
execute store result score $q.mw gm4_ghef_data run data get entity @s transformation.right_rotation[3] 1000

data remove storage gm4_ghef:temp quat
