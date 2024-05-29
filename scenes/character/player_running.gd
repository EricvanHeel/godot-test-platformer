class_name player_running
extends State

@export var actor : player
@export var animation : AnimationPlayer


func ready():
	pass

func state_enter():
	animation.play("running")
	pass
func state_process(delta):
	if actor.velocity == Vector2.ZERO:
		Transitioned.emit(self,"player_idle")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self,"player_attacking")
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self,"player_jumping")

func state_physics_process(delta):
	pass
func state_exit():
	pass
