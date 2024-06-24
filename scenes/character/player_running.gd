class_name PlayerRunning
extends State

@export var actor: Player
@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("running")

func state_process(delta: float) -> void:
	if actor.velocity == Vector2.ZERO:
		transitioned.emit(self,"PlayerIdle")
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self,"PlayerAttacking")
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self,"PlayerJumping")
	if actor.velocity.y > 150:
		transitioned.emit(self, "PlayerFalling")
