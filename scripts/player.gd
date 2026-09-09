extends CharacterBody2D


const SPEED = 200
var JUMP_VELOCITY = -400

var gravity = 1500.0
var flip_speed = 10.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("twist"):
		gravity *= -1
		JUMP_VELOCITY *= -1
		flip_speed *= -1
		up_direction = Vector2(0, -sign(gravity))
		velocity.y = sign(gravity) * 50.0
		
	var distance_to_text = $"../RichTextLabel".position.distance_to($".".position)
	print(maxf(10, 210-distance_to_text))
	$"../RichTextLabel".modulate.a = maxf(10, 210-distance_to_text)/255

	move_and_slide()
	
	$".".scale.y = move_toward($".".scale.y, 1*sign(flip_speed), abs(flip_speed)*delta)
