# Gate code
extends StaticBody2D

export var gateIsUp = false

func setGate(isUp:bool) -> void:
	gateIsUp = isUp
	if gateIsUp:
		set_global_rotation_degrees(35)
	else:
		set_global_rotation_degrees(-35)


func _input(event):
	if event.is_action_pressed("ui_up"):
		setGate(true)
	elif event.is_action_pressed("ui_down"):
		setGate(false)
	
