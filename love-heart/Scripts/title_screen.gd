extends Control

var button_type = null


func _on_start_pressed() -> void:
	button_type = "start"
	$CanvasLayer/Fade_Rect.show()
	$CanvasLayer/Fade_Rect/Fade_Timer.start()
	$CanvasLayer/Fade_Rect/AnimationPlayer.play("f_in")

func _on_stage_select_pressed() -> void:
	button_type = "stage select"
	$CanvasLayer/Fade_Rect.show()
	$CanvasLayer/Fade_Rect/Fade_Timer.start()
	$CanvasLayer/Fade_Rect/AnimationPlayer.play("f_in")


func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://Scenes/test_level.tscn")
