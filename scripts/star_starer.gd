extends Node2D

var stars_scene = preload("res://scenes/stars.tscn")
var starAmount = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in starAmount:
		var stars_instance = stars_scene.instantiate()
		add_child(stars_instance)
		stars_instance.position = Vector2(randi_range(0,625)*4,randi_range(0,625)*4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
