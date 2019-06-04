extends "res://Scripts/SwordFighter.gd"

func _update_graphics():
	._update_graphics()
	$Silhouette.moving = movement != Vector2(0, 0)
	$Silhouette.direction = direction