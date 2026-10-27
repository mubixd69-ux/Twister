extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	GameManager.coins_collected += 1
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.set_deferred("disabled", true )
	$AudioStreamPlayer2D.play()
	

		
