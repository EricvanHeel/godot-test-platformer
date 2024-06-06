class_name PlayerJumping
extends State

@export var actor: Player
@export var animation: AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("jump")
	
func state_process(delta):
	if actor.velocity.y > 0:
		transitioned.emit(self,"PlayerFalling")
func state_physics_process(delta):
	animation.play("jump_up")
	
func state_exit():
	pass

