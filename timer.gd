extends Label

var delay = Timer.new()

func _ready():
	pass


func _on_car2_timerChange():
	var timer = get_parent().get_parent().get_parent().get_node("car2").timer
	text = "\n\n\n\n\nTime left \nuntil next \nhit:\n" + String(round(timer))
	
	if (timer < 0):
		text = "Draw!"
		print("Draw!")
		get_tree().reload_current_scene()
		
	
	
