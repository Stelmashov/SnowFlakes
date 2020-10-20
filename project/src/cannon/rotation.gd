extends Sprite

func _process(delta):
	rotation = owner.get_angle_to(owner.crosshair.global_position)
