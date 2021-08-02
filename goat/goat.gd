# Goat script

extends KinematicBody2D

var target:Position2D = null

#enum goatState {
#	BABY_GOING_TO_PASTURE,
#	BABY_GROWING,
#	MILLING_IN_PASTURE,
#	GOING_TO_TUNNEL,
#	IN_TUNNEL,
#	IN_UNKNOWN_DESTINY,
#	IN_BREEDING_AREA,
#	BREEDING,
#	RETIRING
#}

var goatMindset = Globals.goatState.MILLING_IN_PASTURE

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("goats")
	goatMindset = Globals.goatState.MILLING_IN_PASTURE

var speed = 250
var hue = 0.0

#var direction = Vector2(0, 0)
#var velocity = Vector2(0, 0)

func changeState(newState:int):
	assert(newState < len(Globals.goatState))
	print("changing state to ", newState)
	
	if newState == Globals.goatState.GOING_TO_TUNNEL:
		setTarget(Globals.startOfTunnelLocation)
		print("heading to target ", Globals.startOfTunnelLocation)

	goatMindset = newState


func setTarget(newTarget: Position2D):
	target = newTarget
	print("Got new target ", target)
	
func _process(_delta):
	if goatMindset == Globals.goatState.MILLING_IN_PASTURE:
		pass
	elif goatMindset == Globals.goatState.GOING_TO_TUNNEL:
		pass

# warning-ignore:unused_argument
func _physics_process(delta):
	var velocity = Vector2(0, 0)
	var direction = Vector2(0, 0)
	
	if target != null:
		direction = target.position - position
		direction = direction.normalized()

	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)

	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)

	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)

		hue += 0.01
		$bodycolor.set_modulate(Color.from_hsv(hue, 1, 1, 1.0))


	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)

		hue -= 0.01
		$bodycolor.set_modulate(Color.from_hsv(hue, 1, 0.5, 1.0))

	direction = direction.normalized()
	velocity = direction * speed

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
