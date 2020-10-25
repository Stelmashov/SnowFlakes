extends Node2D

onready var stats = $stats
onready var world = get_tree().get_root().get_node("World")


func _on_stats_no_health():
	world.game_over()


func _on_hurtbox_area_entered(area):
	pass


func take_damage(damage):
	stats.health -= damage


func _on_hurtbox_body_entered(body):
	take_damage(body.damage)
	body.queue_free()
	print(stats.health)
