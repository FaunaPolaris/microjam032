extends Area2D

var sensor = 0
var emotion = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += Global.speed * delta
	if position.y > 600:
		queue_free()
		Global.miss += 1
	if sensor == 1:
		if Global.sad_sensor == 1:
			if Input.is_action_just_pressed("ui_left"):
				queue_free()

func _on_Sad_Mvmnt_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1

func _on_Sad_Mvmnt_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
