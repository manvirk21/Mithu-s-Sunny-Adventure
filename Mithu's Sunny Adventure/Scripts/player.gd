# This script defines the behavior of the player character.

extends CharacterBody2D  # Inheriting from the CharacterBody2D class

# Initial velocity vector for the player.
var vel = Vector2.ZERO

# Exported variables for jump velocity and gravity scale.
@export var jump_vel = 600.0
@export var gravity_scale = 20.0

# Player's score.
var score = 0

# Enumeration for player states.
enum {
	JUMP,
	RUN,
	IDLE
}

# Initial state of the player.
var state = RUN

# Reference to the AnimatedSprite2D node for animations.
@onready var animation = $AnimatedSprite2D

# Called when the node is ready.
func _ready():
	# Connect signals to respective functions.
	Signals.connect("rewardplayer", rewardplayer)
	Signals.connect("killplayer", killplayer)

# Called every physics frame.
func _physics_process(delta):
	# Match the current state of the player.
	match state:
		RUN:
			# Play the run animation.
			animation.play("run")
		JUMP:
			# Set vertical velocity for jumping.
			vel = Vector2.ZERO
			vel.y -= jump_vel
			# Play the jump animation and set state to IDLE.
			animation.play("jump")
			state = IDLE
		IDLE:
			# Do nothing in the idle state.
			pass
	# Apply gravity to the player.
	vel.y += gravity_scale
	# Move and collide the player.
	move_and_collide(vel * delta)

# Called for input events.
func _input(event):
	# Check if the player is in the running state.
	if state == RUN:
		# Check if the jump action is pressed.
		if event.is_action_pressed("jump"):
			# Change player state to JUMP.
			state = JUMP

# Called when a body enters the area.
func _on_area_2d_body_entered(body):
	# Check if the entering body is a StaticBody2D.
	if body is StaticBody2D:
		# Change player state to RUN.
		state = RUN

# Called when a body exits the area.
func _on_area_2d_body_exited(body):
	# Check if the exiting body is a StaticBody2D.
	if body is StaticBody2D:
		# Change player state to JUMP.
		state = JUMP

# Function to reward the player with a score.
func rewardplayer(scoretoadd):
	# Increment the player's score.
	score += scoretoadd
	# Emit a signal to update the score display.
	Signals.emit_signal("updatescore", score)

# Function to handle player death.
func killplayer():
	# Free the memory occupied by the player.
	queue_free()
