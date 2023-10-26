extends RigidBody2D

@export var speed = 750
const explosion_radius: float = pow(350.0, 2)
@export var damage: int = 50

var is_exploding: bool = false


func explode():
	is_exploding = true
	$AnimationPlayer.play("Explosion")


func finish_explosion():
	is_exploding = false
	queue_free()


func _process(_delta):
	if not is_exploding:
		return
	var items = get_tree().get_nodes_in_group('container') + get_tree().get_nodes_in_group('entities')
	for item in items:
		if 'hit' in item and global_position.distance_squared_to(item.global_position) <= explosion_radius:
			item.hit(damage)
	is_exploding = false
