class_name PlayerIdle
extends State

@export var actor: Player
@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("idle")
#	if actor.saved_direction.x < 0:
#		animation.play("idle_left")
#	elif actor.saved_direction.x > 0:
#		animation.play("idle_right")

func state_process(delta: float) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		transitioned.emit(self, "PlayerRunning")
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self, "PlayerAttacking")
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self, "PlayerJumping")
	if actor.velocity.y > 150:
		transitioned.emit(self, "PlayerFalling")

func state_physics_process(delta: float) -> void:
	pass
