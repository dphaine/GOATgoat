# Globals!
# This is a singleton object to contain the global variables
extends Node2D

# Since this is a singleton, these are globals and can be 
# shared between scenes

# Access this with: Globals.startOfTunnelLocation = $StartOfTunnel
var startOfTunnelLocation : Node2D
var endOfTunnelLocation : Node2D
var destinyLocation : Node2D
var breedingLocation : Node2D

enum goatState {
	BABY_GOING_TO_PASTURE,
	BABY_GROWING,
	MILLING_IN_PASTURE,
	GOING_TO_TUNNEL,
	IN_TUNNEL,
	IN_UNKNOWN_DESTINY,
	IN_BREEDING_AREA,
	BREEDING,
	RETIRING
}

# Number of sheepProcessed
var sheepProcessed: int = 0

## Paths to subsequent levels.  The last one is the final tally
#const levelPaths = ["res://Level1.tscn", "res://Level2.tscn", "res://Level3.tscn", "res://fullWinScreen.tscn"]
#const menuScreenPath : String = "res://title_screen/TitleScreen.tscn"
#const caughtScreenPath : String = "res://CaughtScreen.tscn"
#const winScreenPath : String = "res://WinScreen.tscn"

# Is the player big or small?
#var playerIsBig : bool = false  # Access using Globals.playerIsBig
#var playerPosition : Vector2 # So net can find the fish

#var stopwatchTime : float = 0.0 # current stopwatch time
#var level : int = 1 # The current level you are on
#var levelTimes = [0.0, 0.0, 0.0] # Times of all three levels

#var currentLevel = 0 setLevel
#var score = 0 setget setScore
#var health = 100

# Anything that wants to be notified fo this signal should do...
# ?

#signal scoreChanged
#signal healthChanged

func _ready():
	#Sound.play("res://sounds/Chamber-of-Jewels.mp3", -11)
#	$ThemeMusicPlayer.play()
#	MusicPlayerGlobal.playIt()
	pass

# When score is changed
#func setScore(newScore):
#	print("New score is: ", newScore)
#	score = newScore
#	emit_signal("scoreChanged", score) # Notify listeners
