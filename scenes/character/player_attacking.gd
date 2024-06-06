class_name PlayerAttacking
extends State

@export var actor: Player
@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("swing")
	
func state_process(delta: float) -> void:
	if animation.is_playing() == false:
		transitioned.emit(self, "PlayerIdle")

func state_physics_process(delta: float) -> void:
	actor.velocity = Vector2.ZERO
