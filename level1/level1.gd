extends Node2D

const MAXSHEEP = 11

enum levelStates {
	MILLING_ABOUT,
	SORTING,
	BREEDING,
	GOING_HOME
}

var levelState = levelStates.MILLING_ABOUT

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
	
	yield(get_tree().create_timer(2.0), "timeout")
	changeLevelState(levelStates.SORTING)
	
	# Hey goats!  Go to the tunnel!
	get_tree().call_group("goats", "changeState", Globals.goatState.GOING_TO_TUNNEL)
	
func changeLevelState(newState: int):
	assert(newState < len(levelStates))
	levelState = newState
	
	if newState == levelStates.SORTING:
		$Camera.goto($MiddleOfTunnel)

	elif newState == levelStates.BREEDING:
		$Camera.goto($breedingLocation)
		
	elif newState == levelStates.GOING_HOME:
		pass

	elif newState == levelStates.MILLING_ABOUT:
		pass

	else:
		assert(false)
	
func _process(_delta):
	assert(levelState < len(levelStates))
	
	if levelState == levelStates.SORTING:
		if Globals.sheepProcessed >= MAXSHEEP:
			$Camera.goto($MiddleOfTunnel)
			changeLevelState(levelStates.BREEDING)

	elif levelState == levelStates.BREEDING:
		pass
		
	elif levelState == levelStates.GOING_HOME:
		pass

	elif levelState == levelStates.MILLING_ABOUT:
		pass

	else:
		assert(false)
		
