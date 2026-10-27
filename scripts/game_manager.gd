extends Node

var coins_collected: int = 0
var level_time: float = 0.0
var timer_active: bool = false

func reset_stats() -> void:
	coins_collected = 0
	level_time = 0.0
	timer_active = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer_active:
		level_time += delta
