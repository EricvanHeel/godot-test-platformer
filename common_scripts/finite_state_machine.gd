class_name FSM
extends Node

# The Finite State Machine (FSM) script can be attached to a basic node and must be included as a parent of the states
# The FSM node must be a part of the scene in which you want a state machine
@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)

	if initial_state:
		initial_state.state_enter()
		current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.state_process(delta)
	print(current_state)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.state_physics_process(delta)

func on_child_transition(state: State, new_state_name: String) -> void:
	if state != current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.state_exit()
	new_state.state_enter()
	current_state = new_state
