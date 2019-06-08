extends "res://Scripts/SwordFighter.gd"

const SWORD_FIGHTER = 0
const MAGICIAN = 1
const MARKSMAN = 2

func _update_graphics():
	._update_graphics()
	$Silhouette.moving = movement != Vector2(0, 0)
	$Silhouette.direction = direction

func transform_to(fighter_class):
	if fighter_class != SWORD_FIGHTER:
		var player
		if fighter_class == SWORD_FIGHTER:
			player = load("res://Scenes/PlayerSwordFighter.tscn").instance()
		elif fighter_class == MAGICIAN:
			player = load("res://Scenes/PlayerMagician.tscn").instance()
		elif fighter_class == MARKSMAN:
			player = load("res://Scenes/PlayerMarksman.tscn").instance()
		player.position = position
		name = "Temp"
		player.name = "Player"
		player.owner = get_parent()
		get_parent().add_child(player)
		player.deal_damage(0)
		queue_free()