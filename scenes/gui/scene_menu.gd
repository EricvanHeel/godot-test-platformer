extends Control

# This is a stupid hack because Godot won't let you cange the minimum size of a button
# except in the editor. So I made a blank button in the editor, pass it in and just duplicate it
@export var button_template: Button
@export var v_box_container: VBoxContainer

var scenes: Array[String] = [
	"res://scenes/buildings/tavern.tscn",
	"res://scenes/buildings/arena.tscn",
	"res://scenes/buildings/test_1.tscn",
	"res://scenes/buildings/test_2.tscn",
	"res://scenes/buildings/test_3.tscn",
	"res://scenes/buildings/test_4.tscn",
	"res://scenes/buildings/test_5.tscn",
]

func _ready() -> void:
	for scene in scenes:
		_add_scene_button(scene)

func _add_scene_button(scene_path: String) -> void:
	var margin_container = MarginContainer.new()
	var button = button_template.duplicate()
	button.text = scene_path.split("/")[-1].split(".tscn")[0].replace("_", "").capitalize()
	button.pressed.connect(self._button_pressed.bind(scene_path))
	button.visible = true
	margin_container.add_child(button)
	v_box_container.add_child(margin_container)

func _button_pressed(scene_path: String) -> void:
	get_parent().get_parent().change_scene(scene_path)
