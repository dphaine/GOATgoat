extends KinematicBody2D

var target:Position2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("goats")


var speed = 250
#var direction = Vector2(0, 0)
#var velocity = Vector2(0, 0)

func setTarget(newTarget: Position2D):
	target = newTarget
	print("Got new target ", target)
	
var hue = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	
# warning-ignore:return_value_discarded
	move_and_slide(velocity)
