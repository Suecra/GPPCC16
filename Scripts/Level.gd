extends Node2D

export(int) var width
export(int) var height

func _ready():
	$Player/Camera2D.limit_right = width * 16
	$Player/Camera2D.limit_bottom = height * 16
