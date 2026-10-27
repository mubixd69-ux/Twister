extends Area2D

var level_ended: bool = false

@export_file("*.tscn") var next_scene: String



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		level_ended = true
		
		GameManager.timer_active = false
		GameManager.coins_collected += 1
		
		$AnimatedSprite2D.play("win")
		$AudioStreamPlayer2D.play()
		$CollisionShape2D.set_deferred("disabled", true )
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.visible = false
		
	
		var fade_anim = get_node("../CanvasLayer/AnimationPlayer")
		if fade_anim:
			fade_anim.play("fade_to_black")
			print("fading")
			
			await fade_anim.animation_finished
			
		if next_scene:
			get_tree().change_scene_to_file(next_scene)
			
