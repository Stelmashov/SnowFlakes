extends TextureButton

onready var panel = get_node("/root/World/Button/Panel/exit_panel")

var fl = 0

func _input(event):
	if event is InputEventKey:
		if (event as InputEventKey).scancode == KEY_ESCAPE:
			if fl == 0:
				get_tree().paused = true
				fl = 1
			else:
				get_tree().paused = false
				fl = 0


func _pressed():
		get_tree().paused = true
		panel.show()

