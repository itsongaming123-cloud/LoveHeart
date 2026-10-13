extends Area2D

var checkpoint_manager: Node2D
var player: Player


func _ready() -> void:
	checkpoint_manager = get_parent().get_node("Checkpoint Manager")
	player = get_parent().get_node("Player")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		_killplayer()
		
func _killplayer():
	player.position = checkpoint_manager.last_location
