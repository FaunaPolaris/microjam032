extends Node2D

const game = preload("res://Emotions/match_game.tscn")

func _process(delta: float) -> void:
	if Global.miss < 60:
		$imortalized.show()
	else:
		$ridiculed.show()
	if Input.is_action_just_pressed("ui_accept"):
		print("restarting")
		Global.miss = 0
		Global.hit = 0
		get_tree().change_scene_to_packed(game)
