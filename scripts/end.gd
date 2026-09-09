extends Area2D

@export_file("*.scene") var next_scene: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	$AnimatedSprite2D.visible = false
	$CollisionShape2D.set_deferred("disabled", true )
	$AudioStreamPlayer2D.play()
	
	var fade_anim = get_node("../CanvasLayer/AnimationPlayer")
	if fade_anim:
		fade_anim.play("fade_to_black")
		print("fading")
		
	if next_scene:
		get_tree().change_scene_to_file(next_scene)
