extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.reset_stats()
	$CanvasLayer/AnimationPlayer.play("Back to normal")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
