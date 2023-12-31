###############################################################################
#VTeleport
#Version: V0.3
#Author u/Trainraider
#We live in a society. Bottom Text.
#
#Increment X in Version VY.Y.X after every commit
#       Above, below, and in init
#
#Issues:
#        If spawn is moved the datapack breaks.
#Really Minor Issues:
#        If you yourself, are the only player on the last page of the list in ui,
#              you can open up a blank page.
#Roadmap:
# V0.4 favorite players list and recents list
# V0.5 teleport to spawn
#        set spawn
#        delete spawn
# V0.6 create a permissions interface managed by external permissions datapack
#        basically just a permission level score requirement to warp and spawn
#        setting/deleting commands that is controlled externally. Permissions
#        plugin will inherit IDManager, which will be locally disabled (or enabled)
#        depending on if a compatible permissions datapack is detected through a score
#        it sets.
# V0.7 teleport to homes
#        set homes
#        delete homes
# V0.8 teleport to Warps
#        set Warps
#        delete warps
# V1.0 Full release after bug fixes.
###############################################################################

tellraw @a[scores={version=1..}] {"text":"[Vanilla Teleport V0.3]","color":"yellow"}
scoreboard players set @a[scores={version=1..}] version 0
scoreboard players enable @a version

execute unless entity @e[tag=cloudTimer] run function vteleport:renew
#ensures all players have a unique ID score for reference with other commands
function vteleport:idmanager/idmanager
#Enables players to request to teleport to other players
function vteleport:tpa/tpa
#Cancels teleport requests
function vteleport:tpcancel/tpcancel
#Gives a player a book with tp commands
function vteleport:tpbook/tpbook
