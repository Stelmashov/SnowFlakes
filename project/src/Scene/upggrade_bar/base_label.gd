extends Label

onready var world = get_node("/root/World")

func _process(delta):
	if world.current_base_level < world.max_base_upgrade:
		set_text(str(world.current_base_upgrade_value))
	else:
		set_text("MAX")
