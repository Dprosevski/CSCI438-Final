extends VehicleBody

signal speedChange

export var SPEED1 = 200
export var initialPos = Vector3(0,1,0)
export var hp1 = 500

var once = false

const ROT = 1

export var speed = 0

var rot = 0


func _physics_process(delta):
	if (once == false):
		initialPos = get_global_transform().origin
		once = true
		
	emit_signal("speedChange")
	
	var need_speed = 0
	var need_rot = 0
	
	if Input.is_action_pressed("move_left"):
		need_rot = ROT
		
	elif Input.is_action_pressed("move_right"):
		need_rot = -ROT
	else:
		need_rot = 0
		
	if Input.is_action_pressed("move_up"):
		need_speed = SPEED1
		
	elif Input.is_action_pressed("move_down"):
		need_speed = -SPEED1
	else:
		need_speed = 0
	
	rot = lerp(rot,need_rot,0.1)
	speed = lerp(speed,need_speed,0.1)
	
	steering = rot
	engine_force = speed
	emit_signal("speedChange")


