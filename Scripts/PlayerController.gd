extends "res://Scripts/Controller.gd"

var joypad_connected = false
var joypad_id: int

func _physics_process(delta):
	var movement = Vector2(0, 0);
	
	if joypad_connected:
		movement = Vector2(Input.get_joy_axis(joypad_id, JOY_AXIS_0), Input.get_joy_axis(joypad_id, JOY_AXIS_1))
	
	if Input.is_action_pressed("player_down"):
		movement.y = 1
	elif Input.is_action_pressed("player_up"):
		movement.y = -1
	if Input.is_action_pressed("player_left"):
		movement.x = -1
	elif Input.is_action_pressed("player_right"):
		movement.x = 1
	controlled_object.move(movement)

func get_joypad():
	var devices = Input.get_connected_joypads()
	if devices.size() > 0:
		return devices[0]
	return -1

func _ready():
	joypad_id = get_joypad()
	joypad_connected = joypad_id != -1
