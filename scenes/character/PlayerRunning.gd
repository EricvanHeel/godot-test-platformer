class_name PlayerRunning
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.queue("running")
	pass
func state_process(delta):
	if actor.velocity == Vector2.ZERO:
		Transitioned.emit(self,"PlayerIdle")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self,"PlayerAttacking")
	if Input.is_action_pressed("jump"):
		Transitioned.emit(self,"PlayerJumping")

func state_physics_process(delta):
	if Input.is_action_pressed("right"):
		actor.velocity.x = actor.move_speed
	elif Input.is_action_pressed("left"):
		actor.velocity.x = -actor.move_speed
	else:
		actor.velocity.x = 0
func state_exit():
	animation.play("RESET")
	pass
