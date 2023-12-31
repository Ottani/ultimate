extends Node

signal health_changed
signal grenade_amount_changed
signal laser_amount_changed


var laser_amount: int = 20:
	set(value):
		laser_amount = value
		laser_amount_changed.emit()


var grenade_amount: int = 5:
	set(value):
		grenade_amount = value
		grenade_amount_changed.emit()


var health: int = 60:
	set(value):
		health = min(value, 100)
		health_changed.emit()

var player_pos: Vector2
