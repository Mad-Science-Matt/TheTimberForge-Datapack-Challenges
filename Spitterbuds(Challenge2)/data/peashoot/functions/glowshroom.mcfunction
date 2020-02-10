#code for glowshrooms

scoreboard players add @e[tag=glowshroom] PEAattacktime 1
scoreboard players add @e[tag=glowshroom] PEAlifetime 1

#firing projectiles
execute as @e[tag=glowshroom,scores={PEAattacktime=600}] at @s if entity @p[distance=24..] run summon minecraft:zombie ~ ~ ~

execute as @e[tag=glowshroom,scores={PEAattacktime=1200}] at @s if entity @p[distance=24..] run summon minecraft:zombie ~ ~ ~

execute as @e[tag=glowshroom,scores={PEAattacktime=1800}] at @s if entity @p[distance=24..] run summon minecraft:skeleton ~ ~ ~

execute as @e[tag=glowshroom] at @s if entity @a[distance=..16] run playsound minecraft:block.bell.resonate ambient @a ~ ~ ~ .07 2






execute as @e[tag=glowshroom,scores={PEAattacktime=1800..}] run scoreboard players set @s PEAattacktime 0

#kills the mushroom if the stem is destroyed


execute as @e[tag=glowshroom] at @s unless block ~ ~-1 ~ minecraft:stone run setblock ~ ~ ~ minecraft:air replace

execute as @e[tag=glowshroom] at @s unless block ~ ~ ~ minecraft:end_rod run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:dragon_breath",Count:1b,tag:{display:{Name:'{"text":"Ghostlight Spores"}',Lore:['{"text":"The undead flock to these"}','{"text":"bizzare mushrooms like moths"}','{"text":"to a flame. The spores it"}','{"text":"produces make for a viable"}','{"text":"alternative for Dragon\'s Breath."}']}}}}

#spitter will despawn without dropping loot after 20 minutes
execute as @e[tag=glowshroom,scores={PEAlifetime=48000..}] at @s if entity @p[distance=24..] run setblock ~ ~ ~ minecraft:air replace

execute as @e[tag=glowshroom] at @s if predicate peashoot:direct_sunlight if entity @p[distance=24..] run setblock ~ ~ ~ minecraft:air replace

execute as @e[tag=glowshroom] at @s unless block ~ ~ ~ minecraft:end_rod run kill @e[type=item,nbt={Item:{id:"minecraft:end_rod"}},distance=..2]

execute as @e[tag=glowshroom] at @s unless block ~ ~ ~ minecraft:end_rod run kill @s


#SPITrng

