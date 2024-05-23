extends CharacterBody2D

const move_speed: float = 150
const jump_velocity: float = 400
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var animation : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# physics process is always called according to the configured frame rate (60 times a sec)
func _physics_process(delta: float):
	var new_velocity: Vector2 = velocity
	if new_velocity == (Vector2.ZERO):
		animation.play("idle")
	elif new_velocity.y < 0:
		animation.play("jump")
		animation.play("jump_up")
	elif new_velocity.y > 0:
		animation.play("jump_transition")
		animation.play("jump_down")
	elif new_velocity.x != 0:
		animation.play("running")
	elif Input.is_action_pressed("Attack"):
		animation.play("swing")
	if not is_on_floor():
		new_velocity.y += gravity * delta
	elif Input.is_key_pressed(KEY_SPACE):
		new_velocity.y = -jump_velocity
	new_velocity.x = 0
	if Input.is_key_pressed(KEY_D):
		new_velocity.x += move_speed
	if Input.is_key_pressed(KEY_A):
		new_velocity.x -= move_speed

	velocity = new_velocity
	move_and_slide()
