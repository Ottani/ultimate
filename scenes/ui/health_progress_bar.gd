extends TextureProgressBar

var target_value: float:
	set(new_value):
		_change(new_value)

var tween: Tween


func _ready():
	target_value = value


func _change(new_value: float):
	if tween:
		tween.kill()
	tween = get_tree().create_tween()
	tween.tween_property(self, 'value', new_value, 1.5).set_ease(Tween.EASE_IN)

