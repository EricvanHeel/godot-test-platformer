class_name player_falling
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("jump_transition")
	
func state_process(delta):
	if actor.velocity.y == 0:
		Transitioned.emit(self,"player_idle")
func state_physics_process(delta):
	animation.play("jump_down")
	
func state_exit():
	animation.play("jump_end")


