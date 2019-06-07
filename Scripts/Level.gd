extends Node2D

const SWORD_FIGHTER = 0
const MAGICIAN = 1
const MARKSMAN = 2

export(int) var width
export(int) var height

var player_class = -1

func _ready():
	$Player/Camera2D.limit_right = width * 16
	$Player/Camera2D.limit_bottom = height * 16

func _physics_process(delta):
	do_debug_keys()

func do_debug_keys():
	if Input.is_key_pressed(KEY_1):
		goto_stage("Level1")
	if Input.is_key_pressed(KEY_2):
		goto_stage("Level2")
	if Input.is_key_pressed(KEY_3):
		goto_stage("Level3")
	if Input.is_key_pressed(KEY_4):
		goto_stage("Level4")
	if Input.is_key_pressed(KEY_5):
		goto_stage("Level5")
	if Input.is_key_pressed(KEY_6):
		goto_stage("TestArea")
	if Input.is_key_pressed(KEY_F1):
		change_player(SWORD_FIGHTER)
	if Input.is_key_pressed(KEY_F2):
		change_player(MAGICIAN)
	if Input.is_key_pressed(KEY_F3):
		change_player(MARKSMAN)

func goto_stage(name: String):
	get_tree().change_scene("res://Scenes/Levels/" + name + ".tscn")

func change_player(fighter_class):
	if player_class != fighter_class:
		var player
		if fighter_class == SWORD_FIGHTER:
			player = load("res://Scenes/PlayerSwordFighter.tscn").instance()
		elif fighter_class == MAGICIAN:
			player = load("res://Scenes/PlayerMagician.tscn").instance()
		elif fighter_class == MARKSMAN:
			player = load("res://Scenes/PlayerMarksman.tscn").instance()
		player.position = $Player.position
		remove_child($Player)
		player.name = "Player"
		add_child(player)
		player_class = fighter_class