extends Label

onready var world = get_node("../../../")

func _process(delta):
	set_text(str(world.money))
