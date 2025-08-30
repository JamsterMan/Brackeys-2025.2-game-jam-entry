extends PathFollow2D

@export var move_speed: float = 3
@export var player: CharacterBody2D
var check_player_visablity: bool = false

func _physics_process(delta: float):
	#progress_ratio += 0.002
	progress += move_speed
	if check_player_visablity:
		_check_if_player_is_visable()

func _check_if_player_is_visable():
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(position, player.position)
	query.exclude = [self]
	var result = space_state.intersect_ray(query)
	if result["collider"].name == "Player" :
		print("Player seen : Game Over")
		#open lose screen
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	check_player_visablity = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	check_player_visablity = false
