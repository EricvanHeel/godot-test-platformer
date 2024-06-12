class_name BartenderPutAway
extends State

@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("put_away")

func state_process(delta: float) -> void:
	if not animation.is_playing():
		transitioned.emit(self, "BartenderTakeOut")
