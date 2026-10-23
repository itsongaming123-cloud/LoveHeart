extends Control

@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var button: Button = $CanvasLayer/ColorRect/MarginContainer/VBoxContainer/Button

func _ready() -> void:
	canvas_layer.visible = false
	Globals.lvl_comp.connect(_on_goal_reached)
func _on_goal_reached():
	canvas_layer.visible = true
	get_tree().paused = true
	
func _on_button_pressed() -> void:
	Globals.next_lvl.emit()
