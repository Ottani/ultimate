extends CharacterBody2D

signal laser(pos: Vector2, dir: Vector2)

@onready var laser_spawn_positions = $LaserSpawnPositions
@onready var laser_cooldown = $LaserCooldown

var player_nearby: bool = false
var can_laser: bool = true
var health: int = 30

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos = laser_spawn_positions.get_children().pick_random().global_position
			var dir = (Globals.player_pos - position).normalized()
			laser.emit(pos, dir)
			can_laser = false
			laser_cooldown.start()


func hit(damage: int):
	health -= damage
	if health <= 0:
		queue_free()
	else:
		var tween = get_tree().create_tween();
		tween.tween_method(set_shader_value, 0.0, 1.0, 0.1)
		tween.tween_method(set_shader_value, 1.0, 0.0, 0.1)


func set_shader_value(value: float):
	$Sprite2D.material.set_shader_parameter('progress', value)


func _on_attack_area_body_entered(_body):
	player_nearby = true


func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_laser_cooldown_timeout():
	can_laser = true
