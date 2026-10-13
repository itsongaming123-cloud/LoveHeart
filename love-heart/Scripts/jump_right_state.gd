extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass
	
func _on_physics_process(_delta:float) -> void:
	# Process Jump Straight Conditions
	if player.velocity.y < 0 and not player.is_on_floor():
		if Input.get_axis("ui_left", "ui_right") < 0:
			animated_sprite.play("Jump Left")
		elif Input.get_axis("ui_left", "ui_right") > 0:
			animated_sprite.play("Jump Right")
		else:
			animated_sprite.play("Jump Straight")
			
func _on_next_transitions() -> void:
	# Process ALL transitions from and to Jump Straight State
	if player.velocity == Vector2.ZERO:
		transition.emit("idle")
	
	if player.is_on_floor():
		if player.is_moving:
			transition.emit("walk")
	
	if not player.is_on_floor():
		if player.velocity.y > 0:
			transition.emit("fall")
	
func _on_enter() -> void:
	pass
	
func _on_exit() -> void:
	animated_sprite.stop()
