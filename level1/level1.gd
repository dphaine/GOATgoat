extends Node2D


var gateIsUp = false


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("goats", "setTarget", $StartOfTunnel)
	$HallCam.current = true

func setGate(up:bool) -> void:
	gateIsUp = up
	if gateIsUp:
		$Gate.set_global_rotation_degrees(35)
	else:
		$Gate.set_global_rotation_degrees(-35)

func _input(event):
	
	if event.is_action_pressed("ui_up"):
		setGate(true)
	elif event.is_action_pressed("ui_down"):
		setGate(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
