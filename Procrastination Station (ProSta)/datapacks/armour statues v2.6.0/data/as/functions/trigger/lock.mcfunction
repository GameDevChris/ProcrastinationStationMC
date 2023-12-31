#
# Description:	Apply or remove as_sealed and/or as_locked tags
# Called by:	as:trigger
# Entity @s:	Player
#
# Locking prevents the book from being used to modify the stand and disables the equipment slots to prevent accidental interaction
#
execute if entity @s[scores={as_trigger=1000}] as @e[type=armor_stand,tag=as_selected] run function as:locking/lock
#
execute if entity @s[scores={as_trigger=1001}] as @e[type=armor_stand,distance=..3,tag=as_locked,tag=!as_sealed,sort=nearest,limit=1,nbt=!{Marker:1b},nbt=!{Invulnerable:1b}] run function as:locking/unlock
#
# Sealing can only be used in creative mode and makes the armor stand invulnerable as well as locking it
#
execute if entity @s[scores={as_trigger=1002},gamemode=creative] if entity @e[type=armor_stand,distance=..3,tag=!as_sealed,sort=nearest,limit=1] run function as:sealing/seal
#
execute if entity @s[scores={as_trigger=1003},gamemode=creative] if entity @e[type=armor_stand,distance=..3,tag=as_sealed,sort=nearest,limit=1] run function as:sealing/seal
