extends Camera2D

func goto(location:Node2D):
	assert(location != null)
	print("Camera going to ", location)
	
	# Tween halfway and outwards
	# Tween the rest of the way and inwards
	$Tween.interpolate_property(self, "position",
		position, location.position, 3,
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()

#func _ready():
#	pass # Replace with function body.

#func _process(delta):
#	pass
