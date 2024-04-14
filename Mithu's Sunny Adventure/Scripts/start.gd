# This script defines the behavior of the start button.

extends Node2D  # Inheriting from the Node2D class

# Called when the button is pressed.
func _on_button_pressed():
	# Change the scene to the game scene.
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
