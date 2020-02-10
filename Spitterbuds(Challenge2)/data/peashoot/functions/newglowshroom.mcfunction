
#Alternative custom head.
#SkullOwner:{Id:"d3772c0b-d0d4-47df-baef-d35cd0bc5d35",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzViMTQ4ZjM4OWNlOTU3NGRkMmE1NjVmM2ZlMjMzNzI0OTc0OThmYTIzNjUyYjlkOTlmNjc4OTVjN2IyYjcwIn19fQ=="}]}}


#Custom head used by the glowshroom.
#SkullOwner:{Id:"6f1aaa4c-03e6-4328-8e4c-28726c31133c",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ3Mzc1YzBhYzNlMjdhZGUyMTkzMDJhZGExODhkZDgzOTkyMTUxYTJhYzhhNGY0OWVlZjQxODk1YWQzNzU2In19fQ=="}]}}


scoreboard players add @a SHROOMrng 1

#fraction of creepers that spawn on stone become glowshrooms instead
execute as @e[type=creeper,tag=!notshroom] at @s unless block ~ ~-1 ~ minecraft:stone run tag @s add notshroom

execute as @e[type=creeper,tag=!notshroom] at @s if predicate peashoot:aboveground run tag @s add notshroom

execute as @e[type=creeper,tag=!notshroom,sort=random,limit=1] at @s if entity @p[scores={SHROOMrng=2..}] run tag @s add notshroom

execute as @e[type=creeper,tag=!notshroom,sort=random,limit=1] at @s if entity @p[scores={SHROOMrng=..1}] unless entity @e[tag=glowshroom,distance=..2] align xyz run summon minecraft:armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,Tags:["newshroom"],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"6f1aaa4c-03e6-4328-8e4c-28726c31133c",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ3Mzc1YzBhYzNlMjdhZGUyMTkzMDJhZGExODhkZDgzOTkyMTUxYTJhYzhhNGY0OWVlZjQxODk1YWQzNzU2In19fQ=="}]}}}}],CustomName:'{"text":"Ghostlight Mushroom"}'}

execute as @a[scores={SHROOMrng=21..}] run scoreboard players set @s SHROOMrng 0




#removes replaced creeper
execute at @e[tag=newshroom] run teleport @e[type=creeper,tag=!notshroom] ~ -256 ~

#adds fern to base of plant. Spitter dies when fern is removed
execute at @e[tag=newshroom] run setblock ~ ~ ~ minecraft:end_rod[facing=down] replace



scoreboard players set @e[tag=newshroom] PEAattacktime 0

scoreboard players set @e[tag=newshroom] PEAlifetime 0



tag @e[tag=newshroom] add glowshroom

tag @e[tag=newshroom] remove newshroom