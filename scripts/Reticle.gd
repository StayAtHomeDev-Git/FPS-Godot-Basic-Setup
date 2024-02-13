extends CenterContainer

@export var RETICLE_LINES : Array[Line2D]
@export var PLAYER_CONTROLLER : CharacterBody3D
@export var RETICLE_SPEED : float= 0.25
@export var RETICLE_DISTANCE : float= 2.0
@export var DOT_RADIUS : float = 1.0
@export var DOT_COLOR : Color = Color.WHITE


# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	adjust_rectile_lines()


func _draw():
	draw_circle(Vector2(0,0),DOT_RADIUS,DOT_COLOR)


func adjust_rectile_lines():
	var vel = PLAYER_CONTROLLER.get_real_velocity()
	var origin = Vector3(0,0,0)
	var pos = Vector2(0,0)
	var speed = origin.distance_to(vel)
	
	#Adjust Reticle Line Position
	RETICLE_LINES[0].position = lerp(RETICLE_LINES[0].position,pos + Vector2(0,-speed * RETICLE_DISTANCE), RETICLE_SPEED) # Top
	RETICLE_LINES[1].position = lerp(RETICLE_LINES[1].position,pos + Vector2(speed * RETICLE_DISTANCE,0), RETICLE_SPEED) #Right
	RETICLE_LINES[2].position = lerp(RETICLE_LINES[2].position,pos + Vector2(0,speed * RETICLE_DISTANCE), RETICLE_SPEED) # Bottom
	RETICLE_LINES[3].position = lerp(RETICLE_LINES[3].position,pos + Vector2(-speed * RETICLE_DISTANCE,0), RETICLE_SPEED) # Left

	
	
	
		
	
