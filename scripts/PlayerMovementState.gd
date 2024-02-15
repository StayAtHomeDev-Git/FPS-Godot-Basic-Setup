class_name PlayerMovementState 

extends State

var PLAYER: Player
var ANIMATION: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	await  owner.ready
	PLAYER = owner as Player
	ANIMATION = PLAYER.ANIMATIONPLAYER

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
