extends Area3D

func _process(delta: float) -> void:
	if has_overlapping_bodies():
		var overlap = get_overlapping_bodies()
		for player in overlap:
			player.position = player.STARTING_POSITION
	position += Vector3(-1, 0, 0) * delta
