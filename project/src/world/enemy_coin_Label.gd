extends Label

onready var base = get_node("/root/World/enemybase_lvl_1")

func _process(delta):
	set_text(str(base.money))
