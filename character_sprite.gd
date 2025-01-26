extends AnimatedSprite2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		play("angry")
	elif Input.is_action_just_pressed("ui_left"):
		play("sad")
	elif Input.is_action_just_pressed("ui_right"):
		play("intense")
