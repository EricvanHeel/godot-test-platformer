extends Control

# This is a stupid hack because Godot won't let you cange the minimum size of a button
# except in the editor. So I made a blank button in the editor, pass it in and just duplicate it
@export var button_template: Button

var scenes: Array[String] = [
	"res://scenes/buildings/tavern.tscn",
	"res://scenes/buildings/arena.tscn"
]

func _ready() -> void:
	for index in scenes.size():
		_add_scene_button(scenes[index], index)

func _add_scene_button(scene_path: String, button_index: int) -> void:
	var button = button_template.duplicate()
	button.text = scene_path.split("/")[-1].split(".tscn")[0].replace("_", "").capitalize()
	button.pressed.connect(self._button_pressed.bind(scene_path))
	button.position = Vector2(119, 50 + (21 * button_index))
	button.visible = true
	add_child(button)

func _button_pressed(scene_path: String) -> void:
	get_parent().get_parent().change_scene(scene_path)
