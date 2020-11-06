class_name StatusBar
extends TextureProgress

onready var stats = get_node("../../../enemybase_lvl_1/stats")
onready var update_tween = $Tween

var max_value_str = "max_health" #DEFAULT VALUE
var value_str = "health" #DEFAULT VALUE

func _process(delta):
	update_max_value()
	update_value()


func _ready():
	max_value = stats.get(max_value_str)
	value = stats.get(max_value_str)
	

func update_max_value():
	value = value / stats.get(max_value_str) * max_value #NEED PT
	max_value = stats.get(max_value_str)

	
func update_value():
	if value != stats.get(value_str) and not update_tween.is_active():
		value = stats.get(value_str)
		#update_tween.interpolate_property(animation, "value", animation.value, stats.get(value_str), 0.175, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.175)
		#update_tween.start()
