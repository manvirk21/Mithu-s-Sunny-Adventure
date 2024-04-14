# This script defines a Node2D-based class for handling scrolling behavior.

extends Node2D  # Inheriting from the Node2D class

# Exporting a variable that controls the scroll speed. This allows it to be modified
# directly from the editor.
@export var scroll_speed = 8

# Function responsible for moving the object horizontally.
func move():
	# Update the object's position by subtracting the scroll speed from its x-coordinate.
	position.x -= scroll_speed

