class_name BartenderCleaning
extends State

@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("cleaning")

func state_process(delta: float) -> void:
	if not animation.is_playing():
		transitioned.emit(self, "BartenderPutAway")
