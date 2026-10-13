extends Node2D

var last_location: Vector2
var player: Player

func  _ready() -> void:
	player = get_parent().get_node("Player")
	last_location = player.global_position
