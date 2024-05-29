class_name player_jumping
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("jump")
	
func state_process(delta):
	if actor.velocity.y > 0:
		Transitioned.emit(self,"player_falling")
func state_physics_process(delta):
	animation.play("jump_up")
	
func state_exit():
	pass

