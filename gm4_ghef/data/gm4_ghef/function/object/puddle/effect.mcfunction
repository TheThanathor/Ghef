
scoreboard players operation $x_abs gm4_ghef_data = @s gm4_ghef.acceleration.x
execute if score $x_abs gm4_ghef_data matches ..-1 run scoreboard players operation $x_abs gm4_ghef_data *= #-1 gm4_ghef_data
scoreboard players operation $z_abs gm4_ghef_data = @s gm4_ghef.acceleration.z
execute if score $z_abs gm4_ghef_data matches ..-1 run scoreboard players operation $z_abs gm4_ghef_data *= #-1 gm4_ghef_data

execute if score $x_abs gm4_ghef_data < $z_abs gm4_ghef_data run scoreboard players operation @s gm4_ghef.acceleration.x *= #-3 gm4_ghef_data
execute if score $x_abs gm4_ghef_data > $z_abs gm4_ghef_data run scoreboard players operation @s gm4_ghef.acceleration.z *= #-3 gm4_ghef_data
