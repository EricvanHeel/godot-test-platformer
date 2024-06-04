class_name PlayerFalling
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("jump_transition")
	
func state_process(delta):
	if actor.is_on_floor() == true:
		Transitioned.emit(self,"PlayerIdle")
func state_physics_process(delta):
	animation.queue("jump_down")
	actor.velocity.y += actor.gravity * delta
	print(actor.velocity.y)
func state_exit():
	animation.play("jump_end")


