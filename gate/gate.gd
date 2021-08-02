# Gate code
extends KinematicBody2D

export var gateIsUp = false

var gateAngle = 0.0
var targetAngle = 0.0

const GATE_SPEED = 400
const GATE_ANGLE_DEGREES = 40 # How much should it go in one direction?
const TOLERANCE = 3

func _ready():
	gateAngle = get_global_rotation_degrees()
	targetAngle = gateAngle
	print("Gate started at ", gateAngle)

func setGate(isUp:bool) -> void:
#	print("changing gate to ", isUp)
	gateIsUp = isUp
	if gateIsUp:
		targetAngle = GATE_ANGLE_DEGREES
	else:
		targetAngle = -GATE_ANGLE_DEGREES

func _process(delta):
	var currentAngle = get_global_rotation_degrees()
	var newAngle = currentAngle
	if currentAngle < targetAngle - TOLERANCE:
		newAngle += GATE_SPEED * delta
	elif currentAngle > targetAngle + TOLERANCE:
		newAngle -= GATE_SPEED * delta
	set_global_rotation_degrees(newAngle)

func _input(event):
	if event.is_action_pressed("ui_up"):
		setGate(true)
	elif event.is_action_pressed("ui_down"):
		setGate(false)
	
