class_name PlayerFalling
extends State

@export var actor: Player
@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("jump_transition")

func state_process(delta: float) -> void:
	if actor.velocity.y == 0:
		transitioned.emit(self,"PlayerIdle")

func state_physics_process(delta: float) -> void:
	animation.play("jump_down")

func state_exit() -> void:
	animation.play("jump_end")
