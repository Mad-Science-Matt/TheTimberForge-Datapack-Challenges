#plant the spitterbud seed by dropping it on grass and throwing a lingering splash potion of healing on it
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_apple",Count:1b,tag:{tag:spitterseed}}},sort=random,limit=1] if block ~ ~-1 ~ minecraft:grass_block if entity @e[type=area_effect_cloud,nbt={Potion:"minecraft:healing"},distance=..3] align xyz run summon minecraft:armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,Tags:["newpeashooter"],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8bd21c1e-33f7-41df-a647-c8d5ef706317",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGI2OTI5Mjc1ZGE4NWRjMGY3ZWUyMGY4OGM3NWZjZTE4NzcxZGZjNjQ1ODZkNzQ1MGJlZDVkOGMwZjRhMiJ9fX0="}]}}}}],CustomName:'{"text":"Spitterbud"}'}


#deletes the seed
execute at @e[tag=newpeashooter] run kill @e[type=item,nbt={Item:{id:"minecraft:golden_apple",tag:{tag:spitterseed}}},distance=..5]

#deletes the potion cloud
execute at @e[tag=newpeashooter] run kill @e[type=area_effect_cloud,distance=..5]

#places the fern at the base of the plant. Breaking the fern will kill the plant
execute at @e[tag=newpeashooter] run setblock ~ ~ ~ minecraft:fern replace



scoreboard players set @e[tag=newpeashooter] PEAattacktime 2

scoreboard players set @e[tag=newpeashooter] PEAlifetime 0



tag @e[tag=newpeashooter] add peashooter

tag @e[tag=newpeashooter] remove newpeashooter