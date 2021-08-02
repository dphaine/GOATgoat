extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Tell all the sheep to go to the first goal
	# (Probably better to change its state??)
#	get_tree().call_group("goats", "setTarget", $StartOfTunnel)
	$HallCam.current = true
	
	Globals.startOfTunnelLocation = $StartOfTunnel
	
	print("pausing...")
	yield(get_tree().create_timer(2.0), "timeout")
	print("...finished pausing")
	get_tree().call_group("goats", "changeState", Globals.goatState.GOING_TO_TUNNEL)
	
	# force = Globals.startOfTunnelLocation.position - positoin
	# force = force.normalized() * multiplier

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
