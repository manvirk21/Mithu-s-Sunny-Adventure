# This script updates the score displayed in a RichTextLabel.

extends RichTextLabel  # Inheriting from the RichTextLabel class

# Called when the node is ready.
func _ready():
	# Connect the "updatescore" signal to the updatescore function.
	Signals.connect("updatescore", updatescore)

# Function to update the displayed score.
func updatescore(score):
	# Convert the score to a string and update the text of the RichTextLabel.
	self.text = str(score)
