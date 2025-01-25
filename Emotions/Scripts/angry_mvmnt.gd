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
		if Global.angry_sensor == 1:
			if Input.is_action_just_pressed("ui_up"):
				queue_free()

func _on_Angry_Mvmnt_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1

func _on_Angry_Mvmnt_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
