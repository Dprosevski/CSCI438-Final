extends VehicleBody


signal hpChange
signal speedChange
signal timerChange

export var SPEED2 = 300
export var initialPos = Vector3(0,1,0)
export var hp2 = 500
export var timer = 30 #timer between hits

var once = false


const ROT = 1
var speed2 = 0
var rot = 0

	
func _physics_process(delta):
	if (once == false):
		initialPos = get_global_transform().origin
		
		once = true
	
	#var engineIdle = AudioStreamPlayer.new()
	#self.add_child(engineIdle)
	#engineIdle.stream = load("res://engineIdle.wav")
	#engineIdle.play()
	
	emit_signal("speedChange")
	emit_signal("timerChange")
	
	var need_speed = 0
	var need_rot = 0
	

	if Input.is_action_pressed("ui_left"):
		need_rot = ROT
		
	elif Input.is_action_pressed("ui_right"):
		need_rot = -ROT
	else:
		need_rot = 0
		
	if Input.is_action_pressed("ui_up"):
		need_speed = SPEED2
		
	elif Input.is_action_pressed("ui_down"):
		need_speed = -SPEED2
	else:
		need_speed = 0
	
	rot = lerp(rot,need_rot,0.01)
	speed2 = lerp(speed2,need_speed,0.01)
	
	steering = rot
	engine_force = speed2
	timer -= delta
#end of function physics

var speed1
var hp1
var damage


func _on_car1_body_entered(body):
	var collisionSlow = AudioStreamPlayer.new()
	self.add_child(collisionSlow)
	collisionSlow.stream = load("res://collisionSlow.wav")
	collisionSlow.play()
	
	timer = 30
	if body.get_name() == "car2":
		speed1 = get_parent().get_node("car1").speed
		hp1 = get_parent().get_node("car1").hp1
		
		if (speed2 > speed1):
			print("car 2 is faster")
			damage = speed2 - speed1
			hp1 -= damage
			
		if (speed1 > speed2):
			print("car 1 is faster")
			damage = speed1 - speed2
			hp2 -= damage
		
		#WINNER
		print("car1 " + String(round(hp1)))
		print("car2 " + String(round(hp2)))
		get_parent().get_node("car1").hp1 = hp1
		get_parent().get_node("car2").hp2 = hp2
		emit_signal("hpChange")

			
		









