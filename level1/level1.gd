extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Tell all the sheep to go to the first goal
	# (Probably better to change its state??)
#	get_tree().call_group("goats", "setTarget", $StartOfTunnel)
	$Camera.current = true
	
	# TO-DO kill off start of tunnel
#	Globals.startOfTunnelLocation = $StartOfTunnel
	Globals.startOfTunnelLocation = $TunnelStartArea
	Globals.endOfTunnelLocation = $EndOfTunnel
	Globals.destinyLocation = $Destiny
	Globals.breedingLocation = $breedingLocation
	
	
	# Hey goats!  Go to the tunnel!
	get_tree().call_group("goats", "changeState", Globals.goatState.GOING_TO_TUNNEL)
	
#func _process(delta):
#	pass
