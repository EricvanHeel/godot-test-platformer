class_name PlayerIdle
extends State

@export var actor : player
@export var animation : AnimationPlayer

func ready():
	pass

func state_enter():
	animation.queue("idle")
	actor.velocity.x = 0


func state_process(delta):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		Transitioned.emit(self, "PlayerRunning")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self,"PlayerAttacking")
	if Input.is_action_pressed("jump"):
		Transitioned.emit(self,"PlayerJumping")

func state_physics_process(delta):
	pass
func state_exit():
	animation.play("RESET")
	
