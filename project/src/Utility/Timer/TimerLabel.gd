class_name InGameTimer
extends Label

var seconds = 0
var minutes = 0


func _process(delta):
	if seconds > 59:
		minutes += 1
		seconds = 0
	if seconds <= 9 and minutes <=9:
		set_text("0"+str(minutes) + ":0" + str(seconds))
	elif seconds <= 9 and minutes > 9:
		set_text(str(minutes)+":0"+str(seconds))
	elif seconds > 9 and minutes <= 9:
		set_text("0"+str(minutes) + ":" + str(seconds))
	else:
		set_text(str(minutes) + ":" + str(seconds))


func _on_seconds_timeout():
	seconds += 1
