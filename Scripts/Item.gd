extends Area2D

enum FighterClass {SWORD_FIGHTER, MAGICIAN, MARKSMAN}

export(FighterClass) var transformation

func _ready():
	connect("body_entered", self, "body_entered")

func body_entered(body):
	if body.name == "Player":
		queue_free()
