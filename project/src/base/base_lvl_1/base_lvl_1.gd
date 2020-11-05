class_name CommonBase
extends Node2D

onready var stats = $stats
onready var world = get_tree().get_root().get_node("World")
var current_base_upgrade_value = 10
var max_base_upgrade = 3
var current_base_level = 1

func _on_stats_no_health():
	world.game_over()


func _on_hurtbox_area_entered(area):
	pass


func take_damage(damage):
	stats.health -= damage


func _on_hurtbox_body_entered(body):
	take_damage(body.damage)
	world.turn += 1
	body.queue_free()
	print(stats.health)
