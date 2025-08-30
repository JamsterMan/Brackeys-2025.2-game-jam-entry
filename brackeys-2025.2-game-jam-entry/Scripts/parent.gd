extends PathFollow2D

@export var move_speed: float = 3
@export var polygon: Polygon2D
var ray_distance:float = 1000
var player: CharacterBody2D
var check_player_visablity: bool = false

func _ready() -> void:
	player = get_node("../../Player")

func _physics_process(delta: float):
	#progress_ratio += 0.002
	progress += move_speed
	if check_player_visablity:
		_check_if_player_is_visable()

func _check_if_player_is_visable():
	var space_state = get_world_2d().direct_space_state
	var ray_query = PhysicsRayQueryParameters2D.create(position, player.position)
	ray_query.exclude = [self]
	var ray_result = space_state.intersect_ray(ray_query)
	if ray_result:
		if ray_result["collider"].name == "Player" :
			print("Player seen : Game Over")
			#open lose screen
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	check_player_visablity = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	check_player_visablity = false


func _on_timer_timeout() -> void:
	#todo use process instead of a timer to remove the bumper areas
	var vec = (_ray_cast_position()-position)*_get_direction()
	var dist = vec.length()
	polygon.set_polygon(PackedVector2Array([Vector2(-25,45),Vector2(-25,-45),Vector2(dist,-45),Vector2(dist,45)]))

func _ray_cast_position() -> Vector2:
	var space_state = get_world_2d().direct_space_state
	var ray_query = PhysicsRayQueryParameters2D.create(position, _get_direction() * ray_distance)
	ray_query.exclude = [self]
	var ray_result = space_state.intersect_ray(ray_query)
	if ray_result:
		return ray_result["position"]
	return Vector2.ZERO

func _get_direction() -> Vector2:
	var vec = Vector2.ZERO
	vec.x = cos(rotation)
	vec.y = sin(rotation)
	return vec
