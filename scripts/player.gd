extends CharacterBody2D


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 200
const MAX_COOLDOWN = 1.5
var JUMP_VELOCITY = -500
var current_cooldown = 0


var gravity = 1500.0
var flip_speed = 10.0

@onready var cooldown_bar: TextureProgressBar = $CanvasLayer/CooldownBar
var bar_tween: Tween

func _ready() -> void:
	cooldown_bar.step = 0.0
	cooldown_bar.max_value = MAX_COOLDOWN
	cooldown_bar.value = 0.0
	cooldown_bar.modulate.a = 0.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("twist") and current_cooldown <= 0:
		gravity *= -1
		JUMP_VELOCITY *= -1
		flip_speed *= -1
		up_direction = Vector2(0, -sign(gravity))
		current_cooldown = MAX_COOLDOWN
		show_cooldown_bar()
		

		if sign(velocity.y) == sign(gravity):
			var new_jump_power = abs(JUMP_VELOCITY)/2/maxf(abs(velocity.y)/abs(JUMP_VELOCITY), 0.5)
			velocity.y = new_jump_power * sign(-gravity)

		if abs(velocity.y) < 50.0:
			velocity.y = sign(-gravity) * 50.0
			
	if current_cooldown > 0:
		current_cooldown -= delta
		
	var distance_to_text = $"../RichTextLabel".position.distance_to($".".position)
	
	$"../RichTextLabel".modulate.a = maxf(10, 225-distance_to_text)/255
	
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	if not is_on_floor():
		sprite.play("jump")
	elif direction != 0:
		sprite.play("run")
	else:
		sprite.play("idle")
	
	move_and_slide()
	print(is_on_floor())
	
	$".".scale.y = move_toward($".".scale.y, 1*sign(flip_speed), abs(flip_speed)*delta)

func show_cooldown_bar() -> void:
	if bar_tween:
		bar_tween.kill()
	cooldown_bar.value = 0.0
	cooldown_bar.modulate.a = 1.0
	bar_tween = create_tween()
	bar_tween.tween_property(cooldown_bar, "value", MAX_COOLDOWN, MAX_COOLDOWN)
	bar_tween.tween_property(cooldown_bar, "modulate:a", 0.0, 0.3)
	
