$data modify entity 0-0-0-0-0 transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]
execute store result score $magnitude gm4_ghef_data run data get entity 0-0-0-0-0 transformation.scale[0] 1000
