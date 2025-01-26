extends Area2D

@onready var animation = $AnimationPlayer
var sensor = 0

func _process(delta) -> void:
	if sensor == 1:
		if Input.is_action_just_pressed("ui_right"):
			animation.play("right")
			Global.hit += 1
			if not $cheer.playing:
				$cheer.play()

	if sensor == 0:
		if Input.is_action_just_pressed("ui_right"):
			animation.play("wrong")
			Global.miss += 1
			if not $boo.playing:
				$boo.play()

func _on_Sad_Match_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 1
	Global.intense_sensor = 1

func _on_Sad_Match_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	sensor = 0
	Global.intense_sensor = 0
