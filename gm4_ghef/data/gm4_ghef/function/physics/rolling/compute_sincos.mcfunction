
$execute positioned 0.0 0.0 0.0 rotated $(angle) 0 run tp @e[type=marker,tag=gm4_ghef.compute,limit=1] ^ ^ ^1

execute store result score $m.cos gm4_ghef_data run data get entity @e[type=marker,tag=gm4_ghef.compute,limit=1] Pos[2] 1000
execute store result score $m.sin gm4_ghef_data run data get entity @e[type=marker,tag=gm4_ghef.compute,limit=1] Pos[0] 1000