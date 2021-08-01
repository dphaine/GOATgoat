extends RigidBody2D

var target:Position2D = null

enum goatState {
	BABY_GOING_TO_PASTURE,
	BABY_GROWING,
	MILLING_IN_PASTURE,
	GOING_TO_TUNNEL,
	IN_TUNNEL,
	IN_UNKNOWN_DESTINY,
	IN_BREEDING_AREA,
	BREEDING,
	RETIRING
}

var goatMindset = goatState.MILLING_IN_PASTURE

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(50, 20)
	add_to_group("goats")

var speed = 250
var hue = 0.0

func _process(_delta):
	if goatMindset == goatState.MILLING_IN_PASTURE:
		pass
	elif goatMindset == goatState.GOING_TO_TUNNEL:
		pass

