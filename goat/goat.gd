# Goat script

extends KinematicBody2D

var target:Node2D = null

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
	
	goatMindset = newState
	
	# Initialize each new state
	if newState == Globals.goatState.GOING_TO_TUNNEL:
		setTarget(Globals.startOfTunnelLocation)
		print("heading to target ", Globals.startOfTunnelLocation)

	elif newState == Globals.goatState.IN_TUNNEL:
		setTarget(Globals.endOfTunnelLocation)

	elif newState == Globals.goatState.IN_BREEDING_AREA:
		setTarget(Globals.breedingLocation)
		Globals.sheepProcessed += 1

	elif newState == Globals.goatState.IN_UNKNOWN_DESTINY:
		setTarget(Globals.destinyLocation)
		Globals.sheepProcessed += 1

	elif newState == Globals.goatState.BREEDING:
		target = null # Stop moving


func setTarget(newTarget: Node2D):
	assert(newTarget != null)
	target = newTarget
	print("Got new target ", target)
	
func _process(_delta):
	var overlappingZones = $zoneDetector.get_overlapping_areas()
	
	if goatMindset == Globals.goatState.MILLING_IN_PASTURE:
		pass
	elif goatMindset == Globals.goatState.GOING_TO_TUNNEL:
		for zone in overlappingZones:
			if zone.is_in_group("TunnelStartGroup"):
#				print("Got to TunnelStart!!!")
				changeState(Globals.goatState.IN_TUNNEL)
				
	elif goatMindset == Globals.goatState.IN_TUNNEL:
		for zone in overlappingZones:
			if zone.is_in_group("EndOfTunnelGroup"):
#				print("Got to End of Tunnel!!!")
				if zone.is_in_group("BreedEntrance"):
					print("Yay ", self, " gets to breed")
					changeState(Globals.goatState.IN_BREEDING_AREA)
				else:
					print("I guess ", self, " is retiring")
					changeState(Globals.goatState.IN_UNKNOWN_DESTINY)
		
	elif goatMindset == Globals.goatState.IN_BREEDING_AREA:
		for zone in overlappingZones:
			if zone.is_in_group("BreedingZone"):
				print("Breed me!")
				changeState(Globals.goatState.BREEDING)

	elif goatMindset == Globals.goatState.IN_UNKNOWN_DESTINY:
		for zone in overlappingZones:
			if zone.is_in_group("DestinyZone"):
				queue_free()


# warning-ignore:unused_argument
func _physics_process(delta):
	var velocity = Vector2(0, 0)
	var direction = Vector2(0, 0)
	
	if target != null:
		direction = target.position - position
		direction = direction.normalized()

#	if Input.is_action_pressed("ui_up"):
#		direction += Vector2(0, -1)
#
#	if Input.is_action_pressed("ui_down"):
#		direction += Vector2(0, 1)
#
#	if Input.is_action_pressed("ui_left"):
#		direction += Vector2(-1, 0)
#
#	if Input.is_action_pressed("ui_right"):
#		direction += Vector2(1, 0)

	direction = direction.normalized()
	velocity = direction * speed

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
