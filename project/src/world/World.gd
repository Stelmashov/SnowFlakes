extends Node2D

onready var player_base = get_node("base_lvl_1") #+ str(current_base_level))
onready var timer = $Game_teek
onready var cannon = $Cannon
var money = 0
var increment = 5
var current_money_upgrade_value = 20
var current_base_upgrade_value = 10
var max_money_upgrade = 5
var max_base_upgrade = 3
var current_upgrade = 1
var current_base_level = 1
var gift_value = 15


func _ready():
	print("base_hp:" + str(player_base.get_node("stats").max_health))


func _on_Timer_timeout():
	money += increment


func _on_coin_upgrade_pressed():
	if money - current_money_upgrade_value >= 0 and current_upgrade < max_money_upgrade:
		money -= current_money_upgrade_value
		increment *= 2 
		current_money_upgrade_value *= 2
		current_upgrade += 1


func _on_shield_upgrade_pressed():
	if money - current_base_upgrade_value >= 0 and current_base_level < max_base_upgrade:
		current_base_level += 1
		var texture = "res://assets/wall_level_" + str(current_base_level) + ".png"
		var new_texture = load(texture)
		money -= current_base_upgrade_value
		current_base_upgrade_value *= 3
		player_base.get_node("Sprite").texture = new_texture
		player_base.get_node("stats").max_health = player_base.get_node("stats").max_health * 2
		player_base.get_node("stats").health = player_base.get_node("stats").health * 2
		print("base_hp:" + str(player_base.get_node("stats").max_health))


func _on_present_attack_pressed():
	if money - gift_value >= 0:
		money -= gift_value
		cannon.projectile = preload("res://src/cannon/projectile/gift.tscn")


func game_over():
	print("Game Over!")
	get_tree().paused = true
