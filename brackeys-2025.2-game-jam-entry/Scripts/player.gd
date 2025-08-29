extends CharacterBody2D

@export var speed: int = 300
@export var walk_speed: int = 150
@export var sprite: Sprite2D
var player_direction: Vector2
var walking: bool = false

func _physics_process(delta: float):
	_move_player()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("WALK") :
		walking = true
	if event.is_action_released("WALK") :
		walking = false

func _move_player():
	# Get the input direction and handle the movement/deceleration.
	player_direction.x = Input.get_axis("LEFT", "RIGHT")
	player_direction.y = Input.get_axis("UP", "DOWN")
	if player_direction:
		if walking:
			velocity = player_direction * walk_speed
		else:
			velocity = player_direction * speed
		_rotate_player()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()

func _rotate_player():
	sprite.rotation = player_direction.angle() + deg_to_rad(-90)
	
