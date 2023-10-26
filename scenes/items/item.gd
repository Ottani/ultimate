extends Area2D

const rotation_speed: float = 4
var type: String = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health'].pick_random()

var direction: Vector2
var distance: float = randf_range(150.0, 250.0)

func _ready():
	if type == 'laser':
		$Orb2.modulate = Color(0.2, 0.2, 0.8)
	elif type == 'grenade':
		$Orb2.modulate = Color(0.8, 0.2, 0.2)
	elif type == 'health':
		$Orb2.modulate = Color(0.2, 0.8, 0.2)

	var target_position = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, 'position', target_position, 0.5)
	tween.tween_property(self, 'scale', Vector2(1, 1), 0.3).from(Vector2(0, 0))
	

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'laser':
		Globals.laser_amount += 5
	elif type == 'grenade':
		Globals.grenade_amount += 1
	elif type == 'health':
		Globals.health += 30
	queue_free()
