extends Node2D

onready var player_base = get_node("base_lvl_1") #+ str(current_base_level))
onready var enemy_base = get_node("enemybase_lvl_1")
onready var timer = $Game_teek
onready var cannon_ = $Cannon
onready var camera_ally = $Camera2D
onready var camera_enemy = $Camera2D2
onready var target


var gift_value = 15
var turn = 1

signal next_turn






func _on_coin_upgrade_pressed():
	target = player_base
	coin_upgrade(target)


func _on_shield_upgrade_pressed():
	target = player_base
	shield_upgrade(target)


func _on_present_attack_pressed():
	if target.money - gift_value >= 0:
		target.money -= gift_value
		cannon_.projectile = preload("res://src/cannon/projectile/gift.tscn")


func game_over():
	print("Game Over!")
	get_tree().paused = true


func _on_coin_2_upgrade_pressed():
	target = enemy_base
	coin_upgrade(target)


func _on_shield_2_upgrade_pressed():
	target = enemy_base
	shield_upgrade(target)


func shield_upgrade(target):
	if target.money - target.current_base_upgrade_value >= 0 and target.current_base_level < target.max_base_upgrade:
		target.current_base_level += 1
		var texture = "res://assets/wall_level_" + str(target.current_base_level) + ".png"
		var new_texture = load(texture)
		target.money -= target.current_base_upgrade_value
		target.current_base_upgrade_value *= 3
		target.get_node("Sprite").texture = new_texture
		target.get_node("stats").max_health = target.get_node("stats").max_health * 2
		target.get_node("stats").health = target.get_node("stats").health * 2
		print("base_hp:" + str(target.get_node("stats").health))

func coin_upgrade(target):
	if target.money - target.current_money_upgrade_value >= 0 and target.current_upgrade < target.max_money_upgrade:
		target.money -= target.current_money_upgrade_value
		target.increment *= 2 
		target.current_money_upgrade_value *= 2
		target.current_upgrade += 1


func _on_World_next_turn():
	turn += 1
	if turn %2 == 1:
		player_base.money += player_base.increment
		camera_ally.current = true
		camera_enemy.current = false
	else:
		enemy_base.money += enemy_base.increment
		camera_ally.current = false
		camera_enemy.current = true
