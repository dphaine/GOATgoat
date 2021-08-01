extends RigidBody2D

var target:Position2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(50, 20)
	add_to_group("goats")


var speed = 250

	
var hue = 0.0

