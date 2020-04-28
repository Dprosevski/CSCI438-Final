extends Label

func _ready():
	text = "HP car 1:\n\nHP car 2:\n"
	pass

func _on_car2_hpChange():
	var hp1 = get_parent().get_parent().get_parent().get_node("car1").hp1
	var hp2 = get_parent().get_parent().get_parent().get_node("car2").hp2
	text = "HP car 1:\n" + String(round(hp1)) + "\nHP car 2:\n" + String(round(hp2))
	var delay = Timer.new()
	
	if (hp1 <= 0 || hp2 <= 0):
		if (hp1 <= 0):
			hp1 = 0
			print("Player 2 is the winner!")
			text = "Player 2 is \nthe winner!"
		if (hp2 <= 0):
			hp2 = 0
			print("Player 1 is the winner!")
			text = "Player 1 is \nthe winner!"
		delay.set_wait_time(3)
		delay.set_one_shot(true)
		self.add_child(delay)
		delay.start()
		yield(delay, "timeout")
		get_tree().reload_current_scene()
