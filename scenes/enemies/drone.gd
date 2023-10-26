extends CharacterBody2D

const SPEED = 200.0


func _physics_process(_delta):
	velocity = Vector2.RIGHT * SPEED
	move_and_slide()


func hit(_damage: int):
	print('hit')
