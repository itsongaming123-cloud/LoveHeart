extends Control


func _ready() -> void:
	%GOOOAAALL.hide()
	Globals.lvl_comp.connect(_on_lvl_comp)
	
func _on_lvl_comp():
	visible = true
	%GOOOAAALL.visible = true
	
