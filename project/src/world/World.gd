extends Node2D

onready var player_base = get_node("base_lvl_1") #+ str(current_base_level))
onready var timer = $Game_teek
onready var cannon = $Cannon
onready var camera_ally = $Camera2D
onready var camera_enemy = $Camera2D2
onready var target
var money = 0
var increment = 5
var current_money_upgrade_value = 20

var max_money_upgrade = 5

var current_upgrade = 1

var gift_value = 15
var turn = 1


func _process(delta):
	if turn %2 == 1:
		camera_ally.current = true
		camera_enemy.current = false
	else:
		camera_ally.current = false
		camera_enemy.current = true



#func _ready():
#	print("base_hp:" + str(player_base.get_node("stats").max_health))


func _on_Timer_timeout():
	money += increment


func _on_coin_upgrade_pressed():
	if money - current_money_upgrade_value >= 0 and current_upgrade < max_money_upgrade:
		money -= current_money_upgrade_value
		increment *= 2 
		current_money_upgrade_value *= 2
		current_upgrade += 1


func _on_shield_upgrade_pressed():
	target = get_node("base_lvl_1")
	shield_upgrade(target)


func _on_present_attack_pressed():
	if money - gift_value >= 0:
		money -= gift_value
		cannon.projectile = preload("res://src/cannon/projectile/gift.tscn")


func game_over():
	print("Game Over!")
	get_tree().paused = true


func _on_coin_2_upgrade_pressed():
	pass


func _on_shield_2_upgrade_pressed():
	target = get_node("enemybase_lvl_1")
	shield_upgrade(target)


func shield_upgrade(target):
	if money - target.current_base_upgrade_value >= 0 and target.current_base_level < target.max_base_upgrade:
		target.current_base_level += 1
		var texture = "res://assets/wall_level_" + str(target.current_base_level) + ".png"
		var new_texture = load(texture)
		money -= target.current_base_upgrade_value
		target.current_base_upgrade_value *= 3
		target.get_node("Sprite").texture = new_texture
		target.get_node("stats").max_health = target.get_node("stats").max_health * 2
		target.get_node("stats").health = target.get_node("stats").health * 2
		print("base_hp:" + str(target.get_node("stats").health))
