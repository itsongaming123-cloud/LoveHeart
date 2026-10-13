extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass
	
func _on_physics_process(_delta:float) -> void:
	if player.velocity == Vector2.ZERO:
		animated_sprite.play("Blink")
		
func _on_next_transitions() -> void:
	if player.is_on_floor():
		if player.is_moving and Input.get_axis("ui_left", "ui_right") < 0:
				transition.emit("walk")
		if player.is_moving and Input.get_axis("ui_left", "ui_right") > 0:
				transition.emit("walk")
		
	if player.velocity.y > 0:
		transition.emit("fall")
	
	if player.velocity.y < 0 and not player.is_on_floor():
			transition.emit("jump")
		
func _on_enter() -> void:
	pass
	
func _on_exit() -> void:
	animated_sprite.stop()
