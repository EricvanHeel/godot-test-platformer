extends State
class_name player_idle

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("idle")
#	if actor.saved_direction.x < 0:
#		animation.play("idle_left")
#	elif actor.saved_direction.x > 0:
#		animation.play("idle_right")

func state_process(delta):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		Transitioned.emit(self, "player_running")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self,"player_attacking")
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self,"player_jumping")

func state_physics_process(delta):
	pass
