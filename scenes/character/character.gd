class_name Player
extends CharacterBody2D

const move_speed: float = 150
const jump_velocity: float = 400
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var sprite: Sprite2D
@export var animation: AnimationPlayer
@export var direction: Vector2 = Vector2.ZERO
@export var saved_direction: Vector2

# properties for falling through platforms on collision layer 2
# reference: https://godotforums.org/d/37343-how-can-i-make-my-player-fall-through-a-one-way-platform-with-an-input/2
var collision_mask_default := collision_mask
var collision_mask_fallthrough = collision_mask & ~0b00000000_00000000_00000000_00000010
var drop_start_time: float = 0

func _process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "jump", "crouch")
	if direction != Vector2.ZERO:
		saved_direction = direction

	if saved_direction.x < 0:
		sprite.flip_h = true
	elif saved_direction.x > 0:
		sprite.flip_h = false

# Physics process is always called according to the configured frame rate (60 times a sec)
func _physics_process(delta: float) -> void:
	var new_velocity: Vector2 = velocity

	if is_on_floor() or Time.get_unix_time_from_system() - drop_start_time > 0.2:
		collision_mask = collision_mask_default
	
	if not is_on_floor():
		new_velocity.y += gravity * delta
	elif Input.is_action_pressed("jump"):
		new_velocity.y = -jump_velocity

	# Handle dropping through platforms on collision layer 2
	if Input.is_key_pressed(KEY_S) and is_on_floor():
		collision_mask = collision_mask_fallthrough
		drop_start_time = Time.get_unix_time_from_system()

	new_velocity.x = 0
	if Input.is_action_pressed("right"):
		new_velocity.x += move_speed
	if Input.is_action_pressed("left"):
		new_velocity.x -= move_speed

	velocity = new_velocity
	move_and_slide()
