extends CharacterBody2D

const SPEED = 200.0
const RUN_SPEED = 400.0
const JUMP_VELOCITY = -350.0

var pulos = 0
@onready var animacao := $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		pulos = 0

	if Input.is_action_just_pressed("pulo") and pulos < 2:
		velocity.y = JUMP_VELOCITY
		pulos += 1

	var direction := Input.get_axis("esquerda", "direta")
	var atual_correr = SPEED

	if Input.is_action_pressed("correr"):
		atual_correr = RUN_SPEED

	if direction:
		velocity.x = direction * atual_correr
		animacao.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if not is_on_floor():
		animacao.play("jump")
	elif direction != 0:
		animacao.play("run")
	else:
		animacao.play("idle")

	
	if position.y > 500:
		position.y = 0
		velocity = Vector2.ZERO
