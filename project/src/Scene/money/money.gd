class_name CoinLabel
extends Label

onready var base = get_node("/root/World/base_lvl_1")

func _process(delta):
	set_text(str(base.money))
