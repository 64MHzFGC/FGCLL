extends CharacterBody3D

const SPEED = 4.0
const accel = 10
const JUMP_VELOCITY = 10
const Gravity = 20
const MAX_FALL_SPEED = 8.5
const MAX_WALK_SPEED = 4
const MIN_WALK_SPEED = -4
var facing_right = true
var isJumping = false


func _ready() -> void:
	Engine.max_fps = 60
	Engine.time_scale

func _physics_process(delta):
	var move_dir = 0
	var air_dir = 0
	var just_jump = false
	var grounded = is_on_floor()
	var movingRight = false
	var movingLeft = false
	
	move_dir = 0
	if Input.is_action_pressed("Move_leftp1"):
		move_dir -= 1
		movingLeft = true
	if Input.is_action_pressed("Move_rightp1"):
		move_dir += 1
		movingRight = true
	
	velocity.y -= Gravity * delta
	
	if grounded:
		velocity.x = move_dir * SPEED
	if isJumping:
		velocity.x = air_dir * SPEED
	
	move_and_slide()
	
	if velocity.y < -MAX_FALL_SPEED:
		velocity.y = -MAX_FALL_SPEED
	
	if grounded: 
		velocity.y = 0.1
		if Input.is_action_pressed("Jumpp1"):
			velocity.y = JUMP_VELOCITY
