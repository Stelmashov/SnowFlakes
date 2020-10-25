extends Button

onready var panel = get_node("/root/World/Button/upgrades_hud/Panel/upgrade_panel")

func _pressed():
	panel.hide()
