extends Node2D

onready var timer = $Game_teek
var money = 0
var increment = 100
var current_money_upgrade_value = 20
var max_money_upgrade = 5
var current_upgrade = 1


func _on_Timer_timeout():
	money += increment


func _on_TextureButton_pressed():
	if money - current_money_upgrade_value >=0 and current_upgrade < max_money_upgrade:
		money -= current_money_upgrade_value
		increment *= 2 
		current_money_upgrade_value *= 2
		current_upgrade +=1
