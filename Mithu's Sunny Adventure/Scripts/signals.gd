# This script defines signals that can be emitted by other nodes.

extends Node2D  # Inheriting from the Node2D class

# Signal emitted when the player is killed.
signal killplayer

# Signal emitted when the player is rewarded.
signal rewardplayer

# Signal emitted when the score needs to be updated.
signal updatescore
