#used to determine the remaining lifetime of both the spitter and it's projectiles
scoreboard objectives add PEAlifetime dummy

#used to determine the cooldown between attacks
scoreboard objectives add PEAattacktime dummy

#used to determine the spawning of hostile spitters
scoreboard objectives add SPITrng dummy

#initializing variables
scoreboard players set @a SPITrng 0