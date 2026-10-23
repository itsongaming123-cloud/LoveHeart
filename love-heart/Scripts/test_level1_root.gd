extends Node2D


func _ready() -> void:
	$ColorRect/AnimationPlayer.play("f_out")
