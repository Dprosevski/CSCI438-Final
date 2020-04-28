extends Label



func _ready():
	text = "0 mph"
	pass




func _on_car2_speedChange():
	var speed2 = get_parent().get_parent().get_parent().get_parent().get_node("car2").engine_force
	
	speed2 = round(speed2)
	text = String(speed2) + "mph"
