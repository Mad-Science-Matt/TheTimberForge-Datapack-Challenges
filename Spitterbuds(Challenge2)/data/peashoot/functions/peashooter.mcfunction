#code for friendly spitters

scoreboard players add @e[tag=peashooter] PEAattacktime 1
scoreboard players add @e[tag=peashooter] PEAlifetime 1

#firing projectiles
execute as @e[tag=peashooter,scores={PEAattacktime=1,PEAlifetime=..144000}] at @s if entity @e[tag=hostileMob,distance=..16] run summon minecraft:armor_stand ~ ~ ~ {Small:1b,Marker:1b,Invisible:1b,Tags:["PEAbullet"]}

execute as @e[tag=peashooter,scores={PEAattacktime=1,PEAlifetime=..144000}] at @s if entity @e[tag=hostileMob,distance=..16] run scoreboard players add @e[tag=peashooter] PEAlifetime 40

execute as @e[tag=peashooter,scores={PEAattacktime=1,PEAlifetime=..144000}] at @s if entity @e[tag=hostileMob,distance=..16] run playsound minecraft:entity.fox.spit neutral @p ~ ~ ~ 16


#projectile code. Notice that part of the code is run twice per tick. This is so that the projectile can fly faster without passing through walls or enemies
scoreboard players set @e[tag=!PEAaimed,tag=PEAbullet] PEAlifetime 0

execute as @e[tag=!PEAaimed,tag=PEAbullet] at @s run tp @s ^ ^ ^.1 facing entity @e[tag=hostileMob,sort=nearest,limit=1]

tag @e[tag=!PEAaimed,tag=PEAbullet] add PEAaimed

execute as @e[tag=peashooter] at @s run tp @s ^ ^ ^ facing entity @e[tag=hostileMob,sort=nearest,limit=1]





execute as @e[tag=PEAbullet] at @s unless block ^ ^1 ^.7 minecraft:air run teleport @s ~ -256 ~
execute as @e[tag=PEAaimed,tag=PEAbullet] at @s run tp @s ^ ^ ^.7
scoreboard players add @e[tag=PEAbullet] PEAlifetime 1
teleport @e[tag=PEAbullet,scores={PEAlifetime=30..}] ~ -256 ~

execute as @e[tag=hostileMob,tag=notundead] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:instant_damage 1 0
execute as @e[tag=hostileMob,tag=!notundead] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:instant_health 1 0
execute as @e[tag=hostileMob] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:wither 4 1 true

execute as @e[tag=PEAbullet] at @s if entity @e[tag=hostileMob,distance=..1.5] run teleport @s ~ -256 ~
execute at @e[tag=PEAbullet] run particle minecraft:composter ^ ^1 ^ .1 .1 .1 0 3 normal



execute as @e[tag=PEAbullet] at @s unless block ^ ^1 ^.7 minecraft:air run teleport @s ~ -256 ~
execute as @e[tag=PEAaimed,tag=PEAbullet] at @s run tp @s ^ ^ ^.7
scoreboard players add @e[tag=PEAbullet] PEAlifetime 1
teleport @e[tag=PEAbullet,scores={PEAlifetime=30..}] ~ -256 ~

execute as @e[tag=hostileMob,tag=notundead] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:instant_damage 1 0
execute as @e[tag=hostileMob,tag=!notundead] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:instant_health 1 0
execute as @e[tag=hostileMob] at @s if entity @e[tag=PEAbullet,distance=..1.5] run effect give @s minecraft:wither 4 1 true

execute as @e[tag=PEAbullet] at @s if entity @e[tag=hostileMob,distance=..1.5] run teleport @s ~ -256 ~
execute at @e[tag=PEAbullet] run particle minecraft:composter ^ ^1 ^ .1 .1 .1 0 3 normal



execute as @e[tag=peashooter,scores={PEAattacktime=40..}] run scoreboard players set @s PEAattacktime 0


#friendly spitters need to be fed 1 bonemeal every 3 to 6 days, depending on how often they fought mobs

execute as @e[tag=peashooter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}},distance=..2] run scoreboard players remove @s PEAlifetime 12000
execute as @e[tag=peashooter] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}},distance=..2] run playsound minecraft:entity.player.burp neutral @p ~ ~ ~ 16
execute as @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}},limit=1] at @s if entity @e[tag=peashooter,distance=..2] run kill @s
execute as @e[tag=peashooter,scores={PEAlifetime=..0}] run scoreboard players set @s PEAlifetime 0



execute at @e[tag=peashooter,scores={PEAlifetime=..7}] run particle minecraft:heart ^ ^1 ^ .2 .2 .2 0 1 normal
execute at @e[tag=peashooter,scores={PEAlifetime=144010..}] run particle minecraft:angry_villager ^ ^1 ^ .2 .2 .2 0 1 normal
execute as @e[tag=peashooter,scores={PEAlifetime=144010..}] run scoreboard players set @s PEAlifetime 144000


execute as @e[tag=peashooter] at @s unless block ~ ~ ~ minecraft:potted_fern run kill @s


#144000 ticks = 2 hours
#12000 ticks = 10 minutes