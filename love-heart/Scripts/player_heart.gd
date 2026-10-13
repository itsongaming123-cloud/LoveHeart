class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var is_moving: bool = false
@export var just_jumped: bool = false
const ACCELERATION: float = 800.0
const FRICTION: float = 210.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		just_jumped = true
	elif is_on_floor():
		just_jumped = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
		is_moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
		is_moving = false

	move_and_slide()
	
