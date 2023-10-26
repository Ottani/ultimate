extends ItemContainer


func hit(_damage: int):
	if not is_opened:
		$LidSprite.hide()
		var pos = $SpawnPositions.get_children().pick_random().global_position
		opened.emit(pos, current_direction)
		is_opened = true
