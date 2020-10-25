extends TextureButton

onready var panel = get_node("/root/World/Button/Panel/exit_panel")

func _pressed():
		get_tree().paused = false
		panel.hide()
