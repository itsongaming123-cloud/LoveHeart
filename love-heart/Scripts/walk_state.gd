extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass
	
func _on_physics_process(_delta:float) -> void:
	if player.is_on_floor():
		if player.is_moving and Input.get_axis("ui_left", "ui_right") < 0:
			animated_sprite.play("Walk Left")
		elif player.is_moving and Input.get_axis("ui_left", "ui_right") > 0:
			animated_sprite.play("Walk Right")
		
func _on_next_transitions() -> void:
	if player.velocity == Vector2.ZERO:
		transition.emit("idle")
	
	if player.velocity.y < 0 and not player.is_on_floor():
			transition.emit("jump")
		
	if player.velocity.y > 0:
		transition.emit("fall")
		
func _on_enter() -> void:
	pass
	
func _on_exit() -> void:
	animated_sprite.stop()
