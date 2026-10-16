extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlappingBody = $Area2D.get_overlapping_bodies()
	if overlappingBody.size() > 0:
		$button/CanvasLayer.show()
		if Input.is_action_just_pressed("light"):
			if Global.musicStage == 0:
				get_tree().change_scene_to_file("res://scenes/signal_minigame.tscn")
			elif Global.musicStage == 1:
				get_tree().change_scene_to_file("res://scenes/signal_minigame_2.tscn")
			elif Global.musicStage == 2:
				get_tree().change_scene_to_file("res://scenes/signal_minigame_3.tscn")
	else:
		$button/CanvasLayer.hide()
