class_name PlayerJumping
extends State

@export var actor: Player
@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("jump")
	
func state_process(delta: float) -> void:
	if actor.velocity.y > 0:
		transitioned.emit(self,"PlayerFalling")

func state_physics_process(delta: float) -> void:
	animation.play("jump_up")
