class_name World
extends Node2D

var pause_menu_scene: PackedScene = load("res://scenes/gui/scene_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			_unpause_game()
		else:
			_pause_game()

func _pause_game() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	get_child(0).visible = true

func _unpause_game() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	get_child(0).visible = false

func change_scene(scene_path: String) -> void:
	_unpause_game()
	for index in get_children().size():
		if index > 0:
			get_child(index).queue_free()
			remove_child(get_child(index))
	var scene: PackedScene = load(scene_path)
	var scene_instance = scene.instantiate()
	scene_instance.process_mode = Node.PROCESS_MODE_PAUSABLE
	add_child(scene_instance)
