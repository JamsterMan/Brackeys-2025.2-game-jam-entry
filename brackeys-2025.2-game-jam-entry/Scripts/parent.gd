extends PathFollow2D

@export var move_speed: float = 3

func _physics_process(delta: float):
	#progress_ratio += 0.002
	progress += move_speed
