extends CharacterBody2D

@export var speed: int = 300
@export var walk_speed: int = 150
@export var sprite: Sprite2D
var player_direction: Vector2
var walking: bool = false
var can_run: bool = true

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
			if can_run:
				velocity = player_direction * speed
			else:
				print("Player ran : game over")
				velocity = Vector2.ZERO
				#game over screen
		_rotate_player()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()

func _can_run(run:bool):
	can_run = run

func _rotate_player():
	rotation = player_direction.angle() + deg_to_rad(-90)
	
