extends Button



func _on_pressed() -> void:
	$"../../CanvasLayer/AnimationPlayer".play("fade_to_black")
	await $"../../CanvasLayer/AnimationPlayer".animation_finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
