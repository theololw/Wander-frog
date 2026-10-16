extends Node2D

@export var cooldown = 3
var wander_frog_scene = preload("res://scenes/wander_frog.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = cooldown


func _on_timer_timeout():
	var wander_frog_instance = wander_frog_scene.instantiate()
	add_child(wander_frog_instance)
