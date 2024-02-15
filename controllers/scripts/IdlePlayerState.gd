class_name IdlePlayerState

extends PlayerMovementState

@export var SPEED: float = 0
@export var ACCELERATION : float = 0
@export var DECELERATION : float = 0
@export var TOP_ANIM_SPEED : float = 0

func enter() -> void:
	ANIMATION.pause()

func update(delta):
	PLAYER.update_gravity(delta)
	PLAYER.update_input(SPEED,ACCELERATION,DECELERATION)
	PLAYER.update_velocity()
	
	if PLAYER.velocity.length() > 0.0 and PLAYER.is_on_floor():
		transition.emit("WalkingPlayerState")
