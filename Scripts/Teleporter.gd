extends Area2D

export(String) var destination_level_name

func _ready():
	connect("body_entered", self, "body_entered")

func body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/Levels/" + destination_level_name + ".tscn")
