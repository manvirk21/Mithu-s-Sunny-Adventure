# This script defines the behavior of a pickup item.

# Extending the functionality defined in "scrollmovement.gd".
extends "res://Scripts/scrollmovement.gd"

# Called every physics frame.
func _physics_process(delta):
	move()  # Call the move function inherited from scrollmovement.gd.

# Called when a body enters the pickup area.
func _on_pickup_body_entered(body):
	# Check if the entering body is named "Player".
	if body.name == "Player":
		# Emit a signal to reward the player with a score of 1.
		Signals.emit_signal("rewardplayer", 1)
		# Free the memory occupied by the pickup item.
		queue_free()

# Called when the pickup item exits the screen.
func _on_visible_on_screen_notifier_2d_screen_exited():
	# Free the memory occupied by the pickup item.
	queue_free()
