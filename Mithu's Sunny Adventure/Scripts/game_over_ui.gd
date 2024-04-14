# This script handles the game over logic and UI display.

extends Control  # Inheriting from the Control class

# Function called when the node is ready.
func _ready():
	# Connecting the "killplayer" signal to the gameover function.
	Signals.connect("killplayer", gameover)

# Function to handle the game over event.
func gameover():
	# Changing the scene to the game over UI scene.
	get_tree().change_scene_to_file("res://Scenes/UI/game_over_ui.tscn")

# Function called when the restart button is pressed.
func _on_restart_pressed():
	# Changing the scene back to the main game scene.
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


