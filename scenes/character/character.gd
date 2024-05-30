extends CharacterBody2D

const move_speed: float = 150
const jump_velocity: float = 400
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

# properties for falling through platforms on collision layer 2
# reference: https://godotforums.org/d/37343-how-can-i-make-my-player-fall-through-a-one-way-platform-with-an-input/2
var collision_mask_default := collision_mask
var collision_mask_fallthrough = collision_mask & ~0b00000000_00000000_00000000_00000010
var drop_start_time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Physics process is always called according to the configured frame rate (60 times a sec)
func _physics_process(delta: float):
	var new_velocity: Vector2 = velocity
	
	if is_on_floor() or Time.get_unix_time_from_system() - drop_start_time > 0.2:
		collision_mask = collision_mask_default
	
	if not is_on_floor():
		new_velocity.y += gravity * delta
	elif Input.is_key_pressed(KEY_SPACE):
		new_velocity.y = -jump_velocity
	
	# Handle dropping through platforms on collision layer 2
	if Input.is_key_pressed(KEY_S) and is_on_floor():
		collision_mask = collision_mask_fallthrough
		drop_start_time = Time.get_unix_time_from_system()
		
	new_velocity.x = 0
	if Input.is_key_pressed(KEY_D):
		new_velocity.x += move_speed
	if Input.is_key_pressed(KEY_A):
		new_velocity.x -= move_speed
	
	velocity = new_velocity
	move_and_slide()
