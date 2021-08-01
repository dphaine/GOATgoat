extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("goats", "setTarget", $StartOfTunnel)
	$HallCam.current = true
	
	Globals.startOfTunnelLocation = $StartOfTunnel
	# force = Globals.startOfTunnelLocation.position - positoin
	# force = force.normalized() * multiplier

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
