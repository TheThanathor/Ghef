
$execute positioned 0.0 0.0 0.0 rotated $(x) 0 run tp @e[type=marker,tag=gm4_ghef.compute,limit=1] ^ ^ ^1

data modify storage gm4_ghef:temp matrix.cos set from entity @e[type=marker,tag=gm4_ghef.compute,limit=1] Pos[0]
data modify storage gm4_ghef:temp matrix.sin set from entity @e[type=marker,tag=gm4_ghef.compute,limit=1] Pos[2]

tellraw @a [{"nbt": "matrix.sin","storage": "gm4_ghef:temp"},", ",{"nbt": "matrix.cos","storage": "gm4_ghef:temp"}]