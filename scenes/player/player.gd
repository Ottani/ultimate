extends CharacterBody2D

signal laser_shot(pos: Vector2, dir: Vector2)
signal grenade_shot(pos: Vector2, dir: Vector2)

@export var max_speed: int = 500
var speed = max_speed

var can_laser: bool = true
var can_grenade: bool = true


func _process(_delta):
	# position += Input.get_vector("left", "right", "up", "down") * delta * speed
	velocity = Input.get_vector("left", "right", "up", "down") * speed;
	move_and_slide();
	Globals.player_pos = global_position
	
	look_at(get_global_mouse_position())
	
	if can_laser and Globals.laser_amount > 0 and Input.is_action_pressed("primary"):
		Globals.laser_amount -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser_shot.emit(selected_laser.global_position, player_direction)
		can_laser = false
		#var pdir = Vector3(player_direction.x, player_direction.y, 0) 
		#$Particles.process_material.gravity = pdir * 2000
		$Particles.emitting = true
		$LaserTimer.start()
		
	if can_grenade and Globals.grenade_amount > 0 and Input.is_action_pressed("secondary"):
		Globals.grenade_amount -= 1
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade_shot.emit($GrenadeStartPosition.global_position, player_direction)
		can_grenade = false
		$GrenadeTimer.start()


func hit(damage: int):
	Globals.health -= damage


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true



