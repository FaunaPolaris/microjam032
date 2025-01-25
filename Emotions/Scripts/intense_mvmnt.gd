extends Area2D

var speed = 400
var sensor = 0
var emotion = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	if position.y > 1150:
		queue_free()
	if sensor == 1:
		if Global.intense_sensor == 1:
			if Input.is_action_just_pressed("ui_right"):
				queue_free()

func _on_Intense_Mvmnt_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1

func _on_Intense_Mvmnt_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
