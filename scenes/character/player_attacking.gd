extends State
class_name player_attacking

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("swing")
	
func state_process(delta):
	if animation.is_playing() == false:
		Transitioned.emit(self, "player_idle")

func state_physics_process(delta):
	actor.velocity = Vector2.ZERO
	pass
