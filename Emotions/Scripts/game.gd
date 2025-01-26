extends Node2D

const Sad = preload("res://Emotions/sad_mvmnt.tscn")
const Angry = preload("res://Emotions/angry_mvmnt.tscn")
const Intense = preload("res://Emotions/intense_mvmnt.tscn")
const SadMatch = preload("res://Emotions/sad_match.tscn")
const AngryMatch = preload("res://Emotions/angry_match.tscn")
const IntenseMatch = preload("res://Emotions/intense_match.tscn")

var random = 0
var RNG = RandomNumberGenerator.new()
var audio_player : AudioStreamPlayer
var markers : Array = []
var current_marker_index : int = 0

var	game_started	: bool = false

var pitch_shift_effect : AudioEffectPitchShift
const AUDIO_BUS_INDEX_MAIN = 0

func _ready():
	var sad_match = SadMatch.instantiate()
	var angry_match = AngryMatch.instantiate()
	var intense_match = IntenseMatch.instantiate()
	
	add_child(sad_match)
	sad_match.position = $Match/sad_match_marker.global_position
	add_child(angry_match)
	angry_match.position = $Match/angry_match_marker.global_position
	add_child(intense_match)
	intense_match.position = $Match/intense_match_marker.global_position

	load_markers_from_csv("res://input_keys.csv")
	
	load_audio()

func _process(delta):
	var current_time = audio_player.get_playback_position()

	if Input.is_action_just_pressed("ui_accept") and !game_started:
		game_started = true
		$Logo.hide()
		$Label.start_playing()
		audio_player.play()
	if current_marker_index < markers.size():
		var marker = markers[current_marker_index]
		if current_time >= calculate_spawn_time(marker["time"]):
			spawn_note(marker["note"])
			current_marker_index += 1 
	print("hits: ", Global.hit)
	print("miss: ",  Global.miss)

func calculate_spawn_time(match_time: float) -> float:
	var distance = $Match/angry_match_marker.global_position.y - $Creation/angry_marker.global_position.y 
	var fall_time = distance / Global.speed
	var spawn_time = match_time - fall_time
	
	return spawn_time

func load_audio():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

	var audio_stream = preload("res://monologue.mp3")
	audio_player.stream = audio_stream
	audio_player.bus = "Master"
	
	AudioServer.add_bus_effect(AUDIO_BUS_INDEX_MAIN, AudioEffectPitchShift.new())
	pitch_shift_effect = AudioServer.get_bus_effect(AUDIO_BUS_INDEX_MAIN, 0)
	pitch_shift_effect.pitch_scale = 1.6
	
func load_markers_from_csv(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var lines = file.get_as_text().strip_edges().split("\n")
	file.close()
		
	for line in lines:
		var parts = line.split(",")
		if parts.size() == 2:
			var time = float(parts[0])
			var note = parts[1]
			markers.append({"time": time, "note": note})

func spawn_note(note_name: String):
	match note_name:
		"s":
			var sad = Sad.instantiate()
			add_child(sad)
			sad.position = $Creation/sad_marker.global_position
		"a":
			var angry = Angry.instantiate()
			get_parent().add_child(angry)
			angry.position = $Creation/angry_marker.global_position
		"i":
			var intense = Intense.instantiate()
			get_parent().add_child(intense)
			intense.position = $Creation/intense_marker.global_position
