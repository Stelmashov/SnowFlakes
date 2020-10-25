extends Label

onready var world = get_node("/root/World")

func _process(delta):
	set_text(str(world.money))
