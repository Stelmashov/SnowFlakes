extends RigidBody2D

export var damage = 1# idk float/int
# probably float
var LIFETIME = 2# same + has to be const but changeable in inherited
var direction: Vector2
onready var cannon = get_tree().get_root().get_node("World/Cannon")


func _ready():
	$age.start(LIFETIME)
	global_position += direction #* 6 #* 24


func _process(delta) -> void:
	global_position += direction * cannon.speed * delta


func die() -> void:
	queue_free()


func _on_age_timeout():
	die()


func _on_snowflake_body_entered(body)-> void:
	die()
