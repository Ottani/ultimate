extends LevelParent

var player_tween: Tween

func _on_gate_player_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_house_player_entered():
	if player_tween:
		player_tween.kill()
	player_tween = get_tree().create_tween()
	player_tween.tween_property($Player/Camera2D, 'zoom', Vector2(1, 1), 1)


func _on_house_player_exited():
	if player_tween:
		player_tween.kill()
	player_tween = get_tree().create_tween()
	player_tween.tween_property($Player/Camera2D, 'zoom', Vector2(0.6, 0.6), 2)
