extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("gate unlocked")
	visible = false
	process_mode = PROCESS_MODE_DISABLED
