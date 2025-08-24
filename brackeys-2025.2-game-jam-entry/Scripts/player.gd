extends CharacterBody2D

@export var speed: int = 200 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float):
	move_and_slide()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("UP")):
		print("up")
		velocity += speed * Vector2.UP
	elif (event.is_action_pressed("DOWN")):
		print("down")
		velocity += speed * Vector2.DOWN
	elif(event.is_action_pressed("LEFT")):
		print("left")
		velocity += speed * Vector2.LEFT
	elif(event.is_action_pressed("RIGHT")):
		print("right")
		velocity += speed * Vector2.RIGHT
	
	if(event.is_action_released("UP")):
		print("up")
		velocity -= speed * Vector2.UP
	elif (event.is_action_released("DOWN")):
		print("down")
		velocity -= speed * Vector2.DOWN
	elif(event.is_action_released("LEFT")):
		print("left")
		velocity -= speed * Vector2.LEFT
	elif(event.is_action_released("RIGHT")):
		print("right")
		velocity -= speed * Vector2.RIGHT
