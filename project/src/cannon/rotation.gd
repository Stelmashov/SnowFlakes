extends Sprite

var new_rotation

onready var cannon = get_node("../")

func _process(delta):
	if cannon.is_ready:
		new_rotation = owner.get_angle_to(owner.crosshair.global_position)
		if new_rotation >= deg2rad(-90) and new_rotation <= deg2rad(0):
			rotation = new_rotation
