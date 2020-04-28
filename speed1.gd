extends Label


func _ready():
	text = "0 mph"
	pass


func _on_car1_speedChange():
	var speed1 = get_parent().get_parent().get_parent().get_parent().get_node("car1").engine_force
	speed1 = round(speed1)
	text = String(speed1) + "mph"
