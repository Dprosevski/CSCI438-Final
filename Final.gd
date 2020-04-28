extends Spatial


var car1
var car2
var initialPos1
var initialPos2


func _ready():
	pass


func _process(delta):
	car1 = get_node("car1")
	car2 = get_node("car2")
	initialPos1 = car1.initialPos
	initialPos2 = car2.initialPos
	
	
	if Input.is_action_pressed("reset1"):
		car1.set_translation(initialPos1)

	if Input.is_action_pressed("reset2"):
		car2.set_translation(initialPos2)
	pass

