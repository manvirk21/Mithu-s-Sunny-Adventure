# This script defines a spawner that instantiates scenes at regular intervals.

extends Node2D  # Inheriting from the Node2D class

# Exported variable containing an array of scenes to be spawned.
@export var scenes: Array[PackedScene] = []

# Called when the timer times out.
func _on_timer_timeout():
	# Pick a random scene from the scenes array and instantiate it.
	var scene_instance = scenes.pick_random().instantiate()
	# Add the instantiated scene as a child of the spawner.
	add_child(scene_instance)
