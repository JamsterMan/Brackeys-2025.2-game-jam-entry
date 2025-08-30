extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("no running")
	body._can_run(false)


func _on_area_2d_body_exited(body: Node2D) -> void:
	print("can run")
	body._can_run(true)
