extends TextureButton

onready var panel = get_node("/root/World/Camera2D/exit_panel")

func _pressed():
		get_tree().paused = false
		panel.hide()
