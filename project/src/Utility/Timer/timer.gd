extends RichTextLabel

var seconds = 0
var minutes = 0
var hours = 0

func _process(delta):
	if seconds > 59:
		minutes += 1
		seconds = 0
	if minutes > 59:
		hours+= 1
		minutes= 0
	set_text(str(hours)+":"+str(minutes)+":"+str(seconds))


func _on_seconds_timeout():
	seconds +=1
