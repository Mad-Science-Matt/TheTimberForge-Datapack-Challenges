#code for hostile spitters

scoreboard players add @e[tag=spitter] PEAattacktime 1
scoreboard players add @e[tag=spitter] PEAlifetime 1

#firing projectiles
execute as @e[tag=spitter,scores={PEAattacktime=1}] at @s if entity @a[distance=..16] run summon minecraft:armor_stand ~ ~ ~ {Small:1b,Marker:1b,Invisible:1b,Tags:["PEABADbullet"]}

execute as @e[tag=spitter,scores={PEAattacktime=1}] at @s if entity @a[distance=..16] run playsound minecraft:entity.fox.spit hostile @p ~ ~ ~ 16

scoreboard players set @e[tag=!PEABADaimed,tag=PEABADbullet] PEAlifetime 0


#projectile code. Notice that part of the code is run twice per tick. This is so that the projectile can fly faster without passing through walls or players
execute as @e[tag=!PEABADaimed,tag=PEABADbullet] at @s run tp @s ^ ^ ^.1 facing entity @a[sort=nearest,limit=1]

tag @e[tag=!PEABADaimed,tag=PEABADbullet] add PEABADaimed

execute as @e[tag=spitter] at @s run tp @s ^ ^ ^ facing entity @a[sort=nearest,limit=1]





execute as @e[tag=PEABADbullet] at @s unless block ^ ^1 ^.7 minecraft:air run teleport @s ~ -256 ~
execute as @e[tag=PEABADaimed,tag=PEABADbullet] at @s run tp @s ^ ^ ^.7
scoreboard players add @e[tag=PEABADbullet] PEAlifetime 1
teleport @e[tag=PEABADbullet,scores={PEAlifetime=30..}] ~ -256 ~

execute as @a at @s if entity @e[tag=PEABADbullet,distance=..0.9] run summon minecraft:area_effect_cloud ~ ~ ~ {Particle:"composter",Radius:1.8f,Duration:6,DurationOnUse:-10f,Effects:[{Id:7b,Amplifier:0b,Duration:1,ShowParticles:0b}]}
execute as @a at @s if entity @e[tag=PEABADbullet,distance=..0.9] run effect give @s minecraft:poison 3 0

execute as @e[tag=PEABADbullet] at @s if entity @a[distance=..0.9] run teleport @s ~ -256 ~
execute at @e[tag=PEABADbullet] run particle minecraft:composter ^ ^1 ^ .1 .1 .1 0 3 normal



execute as @e[tag=PEABADbullet] at @s unless block ^ ^1 ^.7 minecraft:air run teleport @s ~ -256 ~
execute as @e[tag=PEABADaimed,tag=PEABADbullet] at @s run tp @s ^ ^ ^.7
scoreboard players add @e[tag=PEABADbullet] PEAlifetime 1
teleport @e[tag=PEABADbullet,scores={PEAlifetime=30..}] ~ -256 ~

execute as @a at @s if entity @e[tag=PEABADbullet,distance=..0.9] run summon minecraft:area_effect_cloud ~ ~ ~ {Particle:"composter",Radius:1.8f,Duration:6,DurationOnUse:-10f,Effects:[{Id:7b,Amplifier:0b,Duration:1,ShowParticles:0b}]}
execute as @a at @s if entity @e[tag=PEABADbullet,distance=..0.9] run effect give @s minecraft:poison 3 0

execute as @e[tag=PEABADbullet] at @s if entity @a[distance=..0.9] run teleport @s ~ -256 ~
execute at @e[tag=PEABADbullet] run particle minecraft:composter ^ ^1 ^ .1 .1 .1 0 3 normal





execute as @e[tag=spitter,scores={PEAattacktime=60..}] run scoreboard players set @s PEAattacktime 0

#kills the spitter if the grass or fern is destroyed

execute as @e[tag=spitter] at @s unless block ~ ~-1 ~ minecraft:grass_block run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:golden_apple",Count:1b,tag:{display:{Name:'{"text":"Spitterbud Seed"}',Lore:['{"text":"Throw this seed onto grass"}','{"text":"and water it with a lingering"}','{"text":"splash potion of healing"}','{"text":"to grow your very own spitterbud!"}','{"text":"Be sure to feed it bonemeal regularly!"}']},tag:spitterseed}}}
execute as @e[tag=spitter] at @s unless block ~ ~-1 ~ minecraft:grass_block run kill @s


execute as @e[tag=spitter] at @s unless block ~ ~ ~ minecraft:fern run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:golden_apple",Count:1b,tag:{display:{Name:'{"text":"Spitterbud Seed"}',Lore:['{"text":"Throw this seed onto grass"}','{"text":"and water it with a lingering"}','{"text":"splash potion of healing"}','{"text":"to grow your very own spitterbud!"}','{"text":"Be sure to feed it bonemeal regularly!"}']},tag:spitterseed}}}

#spitter will despawn without dropping loot after 20 minutes
execute as @e[tag=spitter,scores={PEAlifetime=24000..}] at @s if entity @p[distance=24..] run setblock ~ ~ ~ minecraft:air replace

execute as @e[tag=spitter] at @s unless block ~ ~ ~ minecraft:fern run kill @s




