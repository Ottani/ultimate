extends StaticBody2D

signal player_entered(body: Node2D)
signal player_exited(body: Node2D)

func _on_area_2d_body_entered(body):
	player_entered.emit(body)


func _on_area_2d_body_exited(body):
	player_exited.emit(body)
