# This script extends the functionality of another script called "scrollmovement.gd".

extends "res://Scripts/scrollmovement.gd"  # Extending the behavior defined in scrollmovement.gd

# Function called every physics frame to update the object's movement.
func _physics_process(delta):
	move()  # Calling the move function inherited from scrollmovement.gd

# Function called when the object's collision body enters another body.
func _on_effect_damage_body_entered(body):
	if body.name == "Player":  # Checking if the entering body is named "Player"
		Signals.emit_signal("killplayer")  # Emitting a signal to indicate the player's death
		queue_free()  # Freeing the memory occupied by the object

# Function called when the object exits the screen.
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()  # Freeing the memory occupied by the object when it exits the screen

