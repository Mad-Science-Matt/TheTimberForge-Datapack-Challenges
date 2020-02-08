#fraction of creepers that spawn on grass/dirt/podzol become hostile spitters instead
execute as @e[type=creeper,tag=!notspitter] at @s unless block ~ ~-1 ~ minecraft:grass_block unless block ~ ~-1 ~ minecraft:dirt unless block ~ ~-1 ~ minecraft:podzol run tag @s add notspitter

execute as @e[type=creeper,tag=!notspitter,sort=random,limit=1] at @s run scoreboard players add @a SPITrng 1

execute as @e[type=creeper,tag=!notspitter,sort=random,limit=1] at @s if entity @p[scores={SPITrng=2..}] run tag @s add notspitter

execute as @e[type=creeper,tag=!notspitter,sort=random,limit=1] at @s if entity @p[scores={SPITrng=..1}] unless entity @e[tag=spitter,distance=..2] align xyz run summon minecraft:armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,Tags:["newspitter"],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"8bd21c1e-33f7-41df-a647-c8d5ef706317",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGI2OTI5Mjc1ZGE4NWRjMGY3ZWUyMGY4OGM3NWZjZTE4NzcxZGZjNjQ1ODZkNzQ1MGJlZDVkOGMwZjRhMiJ9fX0="}]}}}}],CustomName:'{"text":"Spitterbud"}'}

execute as @a[scores={SPITrng=11..}] run scoreboard players set @s SPITrng 0




#removes replaced creeper
execute at @e[tag=newspitter] run teleport @e[type=creeper,tag=!notspitter] ~ -256 ~

#adds fern to base of plant. Spitter dies when fern is removed
execute at @e[tag=newspitter] run setblock ~ ~ ~ minecraft:fern replace



scoreboard players set @e[tag=newspitter] PEAattacktime 2

scoreboard players set @e[tag=newpeashooter] PEAlifetime 0



tag @e[tag=newspitter] add spitter

tag @e[tag=newspitter] remove newspitter