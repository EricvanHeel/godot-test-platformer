class_name PlayerJumping
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("jump")
	animation.queue("jump_up")
	actor.velocity.y = -actor.jump_velocity
func state_process(delta):
	if actor.velocity.y > 0:
		Transitioned.emit(self,"PlayerFalling")
func state_physics_process(delta):

	actor.velocity.y += actor.gravity * delta
	if Input.is_action_pressed("right"):
		actor.velocity.x = actor.move_speed
	elif Input.is_action_pressed("left"):
		actor.velocity.x = -actor.move_speed
	else:
		actor.velocity.x = 0
	
func state_exit():
	pass

