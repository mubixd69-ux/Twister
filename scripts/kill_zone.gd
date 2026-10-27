extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("kill")
		$"../../player".position = Vector2(117, 478)
		$"../../player".velocity = Vector2(0, 0)
		$"../../player".gravity = 1500.0
		$"../../player".flip_speed = 10.0
		$"../../player".JUMP_VELOCITY = -500
		$"../../player".up_direction = Vector2(0, -sign(gravity))

		
		
