extends Node

var controlled_object

func _enter_tree():
	controlled_object = get_parent()
	set_physics_process(true)