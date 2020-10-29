extends Camera2D

onready var projectile_instance = get_node("../projectile_instance")

func _process(delta):
	if projectile_instance != null:
		global_position = projectile_instance.global_postion
	else:
		global_position = Vector2(448, 480)
	print(projectile_instance)
