extends StaticBody2D
class_name ItemContainer

signal opened(pos: Vector2, direction: Vector2)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var is_opened: bool = false

func hit(_damage: int):
	print('object')
