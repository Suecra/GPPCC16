extends Node2D

export(bool) var moving
export(Vector2) var direction setget set_direction

const LEFT_UP_START_ANGLE = -157.5
const UP_START_ANGLE = LEFT_UP_START_ANGLE + 45
const RIGHT_UP_START_ANGLE = UP_START_ANGLE + 45
const RIGHT_START_ANGLE = RIGHT_UP_START_ANGLE + 45
const RIGHT_DOWN_START_ANGLE = RIGHT_START_ANGLE + 45
const DOWN_START_ANGLE = RIGHT_DOWN_START_ANGLE + 45
const LEFT_DOWN_START_ANGLE = DOWN_START_ANGLE + 45
const LEFT_START_ANGLE = LEFT_DOWN_START_ANGLE + 45

var current_animation_name = ""

func set_direction(value: Vector2):
	direction = value
	var angle = rad2deg(direction.angle())
	if moving:
		if angle >= LEFT_UP_START_ANGLE and angle < UP_START_ANGLE:
			play_animation("move_left_up")
		elif angle >= UP_START_ANGLE and angle < RIGHT_UP_START_ANGLE:
			play_animation("move_up")
		elif angle >= RIGHT_UP_START_ANGLE and angle < RIGHT_START_ANGLE:
			play_animation("move_right_up")
		elif angle >= RIGHT_START_ANGLE and angle < RIGHT_DOWN_START_ANGLE:
			play_animation("move_right")
		elif angle >= RIGHT_DOWN_START_ANGLE and angle < DOWN_START_ANGLE:
			play_animation("move_right_down")
		elif angle >= DOWN_START_ANGLE and angle < LEFT_DOWN_START_ANGLE:
			play_animation("move_down")
		elif angle >= LEFT_DOWN_START_ANGLE and angle < LEFT_START_ANGLE:
			play_animation("move_left_down")
		else:
			play_animation("move_left")
	else:
		if angle >= LEFT_UP_START_ANGLE and angle < UP_START_ANGLE:
			play_animation("left_up")
		elif angle >= UP_START_ANGLE and angle < RIGHT_UP_START_ANGLE:
			play_animation("up")
		elif angle >= RIGHT_UP_START_ANGLE and angle < RIGHT_START_ANGLE:
			play_animation("right_up")
		elif angle >= RIGHT_START_ANGLE and angle < RIGHT_DOWN_START_ANGLE:
			play_animation("right")
		elif angle >= RIGHT_DOWN_START_ANGLE and angle < DOWN_START_ANGLE:
			play_animation("right_down")
		elif angle >= DOWN_START_ANGLE and angle < LEFT_DOWN_START_ANGLE:
			play_animation("down")
		elif angle >= LEFT_DOWN_START_ANGLE and angle < LEFT_START_ANGLE:
			play_animation("left_down")
		else:
			play_animation("left")

func play_animation(name: String):
	if name != current_animation_name:
		current_animation_name = name
		$AnimationPlayer.play(name)
