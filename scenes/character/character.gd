class_name player
extends CharacterBody2D

const move_speed: float = 150
const jump_velocity: float = 400
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var sprite : Sprite2D
@export var animation : AnimationPlayer
@export var direction : Vector2 = Vector2.ZERO
@export var saved_direction : Vector2
var new_velocity: Vector2 = velocity
var max_speed : float = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	direction = Input.get_vector("left", "right", "jump", "crouch")
	if direction != Vector2.ZERO:
		saved_direction = direction.normalized()
		
	if saved_direction.x < 0:
		sprite.flip_h = true
	elif saved_direction.x > 0:
		sprite.flip_h = false

# physics process is always called according to the configured frame rate (60 times a sec)
func _physics_process(delta: float):

	#if not is_on_floor():
	#	new_velocity.y += gravity * delta
	#elif Input.is_action_pressed("jump"):
		#new_velocity.y = -jump_velocity
	#new_velocity.x = 0
	#if Input.is_action_pressed("right"):
	#	new_velocity.x += move_speed
	#if Input.is_action_pressed("left"):
	#	new_velocity.x -= move_speed

	#velocity = new_velocity
	move_and_slide()
