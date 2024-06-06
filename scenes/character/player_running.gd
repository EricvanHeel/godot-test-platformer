class_name PlayerRunning
extends State

@export var actor: Player
@export var animation: AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("running")
	pass
func state_process(delta):
	if actor.velocity == Vector2.ZERO:
		transitioned.emit(self,"PlayerIdle")
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self,"PlayerAttacking")
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self,"PlayerJumping")

func state_physics_process(delta):
	pass
func state_exit():
	pass
