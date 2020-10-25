extends KinematicBody2D

const DEFAULT_SPEED = 200
const SPEED_INCREASE_PER_FRAME = 50

var projectile = preload("res://src/cannon/projectile/snowflake.tscn")
var is_ready = true
var hold_time = 0.0
var speed = DEFAULT_SPEED

onready var level = get_tree().get_root().get_node("World")#mb can switch to owner
onready var crosshair = level.get_node("Crosshair")
onready var INTERVAL = $INTERVAL

func shoot():
	var projectile_instance = projectile.instance()
	level.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = global_transform
	projectile_instance.direction = (crosshair.global_position - global_position).normalized()


func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		if hold_time < 3.0:
			speed += SPEED_INCREASE_PER_FRAME
		hold_time += delta
	elif Input.is_action_just_released("attack") and is_ready:
		shoot()
		projectile = preload("res://src/cannon/projectile/snowflake.tscn")
		is_ready = false
		INTERVAL.start(2)


func _on_INTERVAL_timeout():
	is_ready = true
	speed = DEFAULT_SPEED
	hold_time = 0.0

