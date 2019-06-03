extends "res://Scripts/Controller.gd"

var player

func _physics_process(delta):
	var position_delta = -(controlled_object.position - player.position)
	controlled_object.move(position_delta)

func _enter_tree():
	._enter_tree()
	player = controlled_object.get_parent().get_node("Player")