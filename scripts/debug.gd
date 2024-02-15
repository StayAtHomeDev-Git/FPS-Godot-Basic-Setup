extends PanelContainer

@onready var property_container = %VBoxContainer

var property
var frames_per_second : String

# Called when the node enters the scene tree for the first time.
func _ready():
		#Set global reference to seld in Global Singleton
		Global.debug = self
		
		#Hide Debug Panel on load
		visible = false

func _process(delta):
	if visible:
		# Use delta time to get approx frames per second and round two decimal places !Disable VSync if fps is stuck at 60!
		frames_per_second = "%.2f" % (1.0/delta) # Gets frames per second evry frame
		#Global.debug.add_property("FPS",frames_per_second,1)

		
func _input(event):
		##Toggle debut panel
		if event.is_action_pressed("debug"):
			visible = !visible

func add_property(title: String, value, order):
	var target
	target = property_container.find_child(title,true,false) # Try to finc Label node with same name
	if !target: # If there is no currente Label node for property (ie. initial load)
			target = Label.new() # Create new Label node
			property_container.add_child(target) # Add new node as child to VBox container
			target.name = title # Set name to title
			target.text = target.name + ": "+ str(value) # Set text value
	elif  visible:
		target.text = title + ": " + str(value) # Update text value
		property_container.move_child(target,order) #Reorder property based on given order value
