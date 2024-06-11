class_name BartenderTakeOut
extends State

@export var animation: AnimationPlayer

func state_enter() -> void:
	animation.play("take_out")

func state_process(delta: float) -> void:
	if not animation.is_playing():
		transitioned.emit(self, "BartenderCleaning")
