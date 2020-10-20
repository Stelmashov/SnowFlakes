extends Label


onready var world = get_node("../../../")

func _process(delta):
	if world.current_upgrade < world.max_money_upgrade:
		set_text(str(world.current_money_upgrade_value))
	else:
		set_text("MAX")
