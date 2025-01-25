extends CharacterBody3D


const	SPEED = 5.0
const	JUMP_VELOCITY = 6
const	STARTING_POSITION = Vector3.ZERO
const	FINAL_POSITION = Vector3(60, 0, 0)

func _physics_process(delta: float) -> void:
	if Game.state == Game.ON_RUN:
		if not is_on_floor():
			velocity += (get_gravity() + Vector3(SPEED, 0, 0)) * delta
		else:
			velocity = Vector3(SPEED, 0, 0)
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if position.x >= FINAL_POSITION.x:
			velocity = Vector3.ZERO
			position = STARTING_POSITION
			Game.state = Game.ON_STAGE
		move_and_slide()
