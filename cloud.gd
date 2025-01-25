extends AnimatedSprite2D

func _process(delta: float) -> void:
	position.x += 100 * delta
	if position.x > 2000:
		position.x = -2000
