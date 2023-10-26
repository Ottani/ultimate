extends Area2D

@export var speed: int = 1000
@export var damage: int = 10
var direction: Vector2 = Vector2.UP


func _ready():
	$Timer.start()


func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if 'hit' in body:
		body.hit(damage)
	queue_free()


func _on_timer_timeout():
	print('laser out')
	queue_free()
