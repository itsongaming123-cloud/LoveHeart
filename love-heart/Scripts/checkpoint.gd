extends Node2D

@export var active: bool = false
var checkpoint_manager: Node2D
@onready var respawn_point: Marker2D = $RespawnPoint

func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("Checkpoint Manager")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		active = true
		checkpoint_manager.last_location = respawn_point.global_position
