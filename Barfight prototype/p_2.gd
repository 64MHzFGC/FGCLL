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


func _physics_process(delta):
	
	
	#define body
	
	var distance = position.x - get_parent().get_node("P1").position.x
	var facing_right
	var facing_left
	var move_dir = 0
	var air_dir = 0
	var _just_jump = false
	var grounded = is_on_floor()
	var _movingRight = false
	var _movingLeft = false
	var crouching
	var actionable = true
	var crouch_actionable = false
	var jump_actionable = false
	
	if position.x < get_parent().get_node("P2").position.x:
		scale.x = 1
		facing_right = true
		facing_left = false
	if position.x > get_parent().get_node("P2").position.x:
		scale.x = -1
		facing_right = false
		facing_left = true
	
	if grounded == false:
		actionable = false
	
	if velocity.y != 0:
		actionable = false
		jump_actionable = true
	
	#define moving
	
	move_dir = 0
	
	if actionable == true: 
		velocity.y = 0.1
		if Input.is_action_pressed("Jumpp2"):
			if !Input.is_action_pressed("Crouchp2"):
				velocity.y = JUMP_VELOCITY
		if !Input.is_action_pressed("Crouchp2"):
			crouching = false
		if Input.is_action_pressed("Crouchp2"):
			crouching = true
			actionable = false
			crouch_actionable = true
			if facing_right:
				scale.y = 0.5
			if facing_left:
				scale.y = -0.5
		if Input.is_action_just_released("Crouchp2"):
			if facing_right:
				scale.y = 1
			if facing_left:
				scale.y = -1
	
	
	if actionable == true:
		if Input.is_action_pressed("Move_leftp2"):
			move_dir -= 1
			_movingLeft = true
		if Input.is_action_pressed("Move_rightp2"):
			move_dir += 1
			_movingRight = true
		if position.y + get_parent().get_node("P1").position.y <= 0.4:
			if distance <= 1:
				if distance >= 0:
					move_dir += 0.7
					if distance <= 0.5:
						move_dir += 0.3
			if distance >= -1:
				if distance <= 0:
					move_dir += -0.7
					if distance >= -0.5:
						move_dir += -0.3
	
	#define physics
	
	velocity.y -= Gravity * delta
	
	if grounded:
		velocity.x = move_dir * SPEED
	if isJumping:
		velocity.x = air_dir * SPEED
	
	if velocity.x > 0:
		_movingRight = true
	if velocity.x < 0:
		_movingLeft = true
	
	move_and_slide()
	
	if velocity.y < -MAX_FALL_SPEED:
		velocity.y = -MAX_FALL_SPEED
	
	#define movement
	
	
	
	
	#define attacks while:
	
	
	#standing
	
