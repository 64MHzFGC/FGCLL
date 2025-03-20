extends CharacterBody3D

const SPEED = 4.0
const accel = 10
const JUMP_VELOCITY = 10
const Gravity = 20
const MAX_FALL_SPEED = 8.5
const MAX_WALK_SPEED = 4
const MIN_WALK_SPEED = -4
var isJumping = false
var button
var startup
var active
var recovery
var p1hp
var p2hp
var p1dmg = 0
var p2dmg = 0
var hitdmg = 0
var hitsize = 0
var hitheight = 0



func roundstart():
	p1hp = 100 - p1dmg
	p2hp = 100 - p2dmg

func damagep2():
	if (position.x - get_parent().get_node("P2").position.x) >= hitsize * -1: 
		if (position.x - get_parent().get_node("P2").position.x) <= hitsize: 
			if (get_parent().get_node("P2").position.y) <= hitheight:
				p2dmg += hitdmg

func attack():
	hitsize = (get_parent().get_node(button).position.x)+((get_parent().get_node(button).scale.x) * 0.5)+(get_parent().get_node("P2").scale.x * 0.5)
	hitheight = (get_parent().get_node(button).position.y)+(get_parent().get_node(button).scale.y)-(get_parent().get_node("P2").scale.y * 0.5)
	(get_parent().get_node(button).position.z) = -21
	await get_tree().create_timer(startup).timeout
	(get_parent().get_node(button).position.z) = 0
	damagep2()
	await get_tree().create_timer(active).timeout
	(get_parent().get_node(button).position.z) = -21
	await get_tree().create_timer(recovery).timeout
	(get_parent().get_node(button).position.z) = -20
	startup -= startup
	active -= active
	recovery -= recovery
	hitdmg -= hitdmg
	hitsize -= hitsize


func _physics_process(delta):
	
			
	
	
	#define body
	var StandAttacks = [(get_parent().get_node("P1/Hitboxes/LPp1").position.z),(get_parent().get_node("P1/Hitboxes/LKp1").position.z),(get_parent().get_node("P1/Hitboxes/MPp1").position.z),(get_parent().get_node("P1/Hitboxes/MKp1").position.z),(get_parent().get_node("P1/Hitboxes/HPp1").position.z),(get_parent().get_node("P1/Hitboxes/HKp1").position.z),(get_parent().get_node("P1/Hitboxes/LPp1").position.z) ]
	var LPZ = (get_parent().get_node("P1/Hitboxes/LPp1").position.z)
	var MPZ = (get_parent().get_node("P1/Hitboxes/MPp1").position.z)
	var HPZ = (get_parent().get_node("P1/Hitboxes/HPp1").position.z)
	var LKZ = (get_parent().get_node("P1/Hitboxes/LKp1").position.z)
	var MKZ = (get_parent().get_node("P1/Hitboxes/MKp1").position.z)
	var HKZ = (get_parent().get_node("P1/Hitboxes/HKp1").position.z)
	var DLPZ = (get_parent().get_node("P1/Hitboxes/2LPp1").position.z)
	var DMPZ = (get_parent().get_node("P1/Hitboxes/2MPp1").position.z)
	var DHPZ = (get_parent().get_node("P1/Hitboxes/2HPp1").position.z)
	var DLKZ = (get_parent().get_node("P1/Hitboxes/2LKp1").position.z)
	var DMKZ = (get_parent().get_node("P1/Hitboxes/2MKp1").position.z)
	var DHKZ = (get_parent().get_node("P1/Hitboxes/2HKp1").position.z)
	var distance = position.x - get_parent().get_node("P2").position.x
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
	var hitboxes = [LPZ, MPZ, HPZ, LKZ, MKZ, HKZ, DLPZ, DMPZ, DHPZ, DLKZ, DMKZ, DHKZ]
	
	roundstart()
	if p1hp != 100: 
		(get_parent().get_node("Camera3D/p1hp/SubViewport/health").value) = p1hp
	if p2hp != 100:
		(get_parent().get_node("Camera3D/p2hp/SubViewport/health").value) = p2hp
		if p2hp <= 0:
			await get_tree().create_timer(0.5).timeout
			actionable = false
			await get_tree().create_timer(0.25).timeout
			(get_parent().get_node("P1/p1body").scale.y) = 1
			await get_tree().create_timer(0.5).timeout
			(get_parent().get_node("Camera3D/Sprite3D").position.z) = -2
			await get_tree().create_timer(2).timeout
			get_tree().quit()
	
	if position.x <= get_parent().get_node("P2").position.x:
		scale.x = 1
		facing_right = true
		facing_left = false
	if position.x >= get_parent().get_node("P2").position.x:
		scale.x = -1
		facing_right = false
		facing_left = true
	
	if grounded == false:
		actionable = false
	
	if velocity.y != 0:
		actionable = false
		jump_actionable = true
	
	
	if LPZ != -20:
		actionable = false
	if LKZ != -20:
		actionable = false
	if MPZ != -20:
		actionable = false
	if MKZ != -20:
		actionable = false
	if HPZ != -20:
		actionable = false
	if HKZ != -20:
		actionable = false
	if DLPZ != -20:
		crouching = true
		actionable = false
	if DLKZ != -20:
		crouching = true
		actionable = false
	if DMPZ != -20:
		crouching = true
		actionable = false
	if DMKZ != -20:
		crouching = true
		actionable = false
	if DHPZ != -20:
		crouching = true
		actionable = false
	if DHKZ != -20:
		crouching = true
		actionable = false
	
	#define moving
	
	move_dir = 0
	
	if actionable == true: 
		velocity.y = 0.1
		if Input.is_action_pressed("Jumpp1"):
			if !Input.is_action_pressed("Crouchp1"):
				velocity.y = JUMP_VELOCITY
		if !Input.is_action_pressed("Crouchp1"):
			crouching = false
		if Input.is_action_pressed("Crouchp1"):
			crouching = true
			actionable = false
			crouch_actionable = true
			(get_parent().get_node("P1/p1body").scale.y) = 0.6
		if !crouching:
			(get_parent().get_node("P1/p1body").scale.y) = 1
	if actionable == true:
		if Input.is_action_pressed("Move_leftp1"):
			move_dir -= 1
			_movingLeft = true
		if Input.is_action_pressed("Move_rightp1"):
			move_dir += 1
			_movingRight = true
		if position.y + get_parent().get_node("P2").position.y <= 0.4:
			if distance <= 1:
				if distance >= 0:
					move_dir += 0.5
					if distance <= 0.5:
						move_dir += 0.5
			if distance >= -1:
				if distance <= 0:
					move_dir += -0.5
					if distance >= -0.5:
						move_dir += -0.5
	
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
	
	if actionable == true:
		if Input.is_action_just_pressed("Light_Punchp1"):
			button = "P1/Hitboxes/LPp1"
			startup = 0.1
			active = 0.05
			recovery = 0.15
			hitdmg += 7
			hitsize += 2
			attack()
	
		if Input.is_action_just_pressed("Light_Kickp1"):
			button = "P1/Hitboxes/LKp1"
			startup = 0.1
			active = 0.03333333333
			recovery = 0.28333333333
			hitdmg += 10
			hitsize += 4
			attack()
	
		if Input.is_action_just_pressed("Medium_Punchp1"):
			button = "P1/Hitboxes/MPp1"
			startup = 0.133333333
			active = 0.06666666666
			recovery = 0.2833333333333
			hitdmg += 5
			hitsize += 4
			attack()
	
		if Input.is_action_just_pressed("Medium_Kickp1"):
			button = "P1/Hitboxes/MKp1"
			startup = 0.15
			active = 0.066666666666
			recovery = 0.31666666666
			hitdmg += 7
			hitsize += 4
			attack()
	
		if Input.is_action_just_pressed("Heavy_Punchp1"):
			button = "P1/Hitboxes/HPp1"
			startup = 0.25
			active = 0.05
			recovery = 0.38333333
			hitdmg += 10
			hitsize += 4
			attack()
	
		if Input.is_action_just_pressed("Heavy_Kickp1"):
			button = "P1/Hitboxes/HKp1"
			startup = 0.2
			active = 0.0666666666666
			recovery = 0.35
			hitdmg += 10
			hitsize += 4
			attack()
	
	#crouching
	
	if crouch_actionable:
		
		if Input.is_action_just_pressed("Light_Punchp1"):
			button = "P1/Hitboxes/2LPp1"
			startup = 0.08333333333
			active = 0.0333333333
			recovery = 0.1333333333333
			hitdmg += 5
			hitsize += 4
			attack()
		
		if Input.is_action_just_pressed("Medium_Punchp1"):
			button = "P1/Hitboxes/2MPp1"
			startup = 0.1166666666
			active = 0.05
			recovery = 0.2833333333
			hitdmg += 10
			hitsize += 4
			attack()
		
		if Input.is_action_just_pressed("Heavy_Punchp1"):
			button = "P1/Hitboxes/2HPp1"
			startup = 0.1666666666
			active = 0.15
			recovery = 0.5833333333
			hitdmg += 20
			hitsize += 4
			attack()
		
		if Input.is_action_just_pressed("Light_Kickp1"):
			button = "P1/Hitboxes/2LKp1"
			startup = 0.05
			active = 0.05
			recovery = 0.2
			hitdmg += 5
			hitsize += 4
			attack()
		
		if Input.is_action_just_pressed("Medium_Kickp1"):
			button = "P1/Hitboxes/2MKp1"
			startup = 0.1333333333
			active = 0.05
			recovery = 0.3
			hitdmg += 7
			hitsize += 4
			attack()
		
		if Input.is_action_just_pressed("Heavy_Kickp1"):
			button = "P1/Hitboxes/2HKp1"
			startup = 0.18333333333
			active = 0.05
			recovery = 0.45
			hitdmg += 10
			attack()
	
