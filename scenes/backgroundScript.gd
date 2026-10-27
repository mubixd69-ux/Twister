extends TextureRect

var speed = 100

func _process(delta: float) -> void:
	$".".position.x -= speed * delta
	if $".".position.x <= -$".".size.x:
		print(-$".".size.x)
		$".".position.x = 2*$".".size.x
