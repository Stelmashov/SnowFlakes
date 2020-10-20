extends KinematicBody2D

const SPEED_INCREASE_PER_FRAME = 100

var projectile = preload("res://src/cannon/projectile/snowflake.tscn")
var is_ready = true
var hold_time = 0.0
var speed = 350

onready var level = get_tree().get_root().get_node("World")#mb can switch to owner
onready var crosshair = level.get_node("Crosshair")
onready var INTERVAL = $INTERVAL

func shoot():
	var projectile_instance = projectile.instance()
	level.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = global_transform
	projectile_instance.direction = (crosshair.global_position - global_position).normalized()
	#projectile_instance.damage = self.damage


func _physics_process(delta):
	if Input.is_action_just_pressed("attack") and is_ready:
		if hold_time < 2.0:
			speed += SPEED_INCREASE_PER_FRAME
			hold_time += delta
	elif Input.is_action_just_released("attack"):
		shoot()
		is_ready = false
		INTERVAL.start(2)


func _on_INTERVAL_timeout():
	is_ready = true





#const DEFAULT_SPEED = 200
#const SPEED_INCREASE_PER_FRAME = 1
#
#onready var sprite = $Sprite
#
#var projectile_scene = preload("res://src/cannon/projectile/snowflake.tscn")
#var throw_speed = DEFAULT_SPEED
#var hold_time = 0.0
#
#func shoot():
#	hold_time = 0.0
#
#	var new_projectile = projectile_scene.instance()
#	new_projectile.speed = throw_speed
#	add_child(new_projectile)
#
#	throw_speed = DEFAULT_SPEED
#
#func _physics_process(delta):
#	if Input.is_action_pressed("attack"):
#
#		if hold_time < 2.0:
#			throw_speed += SPEED_INCREASE_PER_FRAME
#		hold_time += delta
#	elif Input.is_action_just_released("shoot"):
#		shoot()

#func _process(delta):
	#sprite.rotation_degrees += get_global_mouse_position().angle()
