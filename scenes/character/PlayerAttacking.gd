class_name PlayerAttacking
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("swing")
	
func state_process(delta):
	if animation.is_playing() == false:
		Transitioned.emit(self, "PlayerIdle")

func state_physics_process(delta):
	pass
