class_name cannon_rotation
extends Sprite

var new_rotation

var start = -90
var end = 30
var count = 1

onready var cannon = get_node("../")
onready var level = get_node("../../")

func _process(delta):
	if level.turn % 2 == count:
		if cannon.is_ready:
			new_rotation = owner.get_angle_to(owner.crosshair.global_position)
			if new_rotation >= deg2rad(start) and new_rotation <= deg2rad(end):
				rotation = new_rotation
		

