extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.ending == true:
		$AnimationPlayer.play("ending")



func _on_button_pressed():
	Global.musicStage = 0
	Global.introDone = false
	Global.ending = false
	$"fade in_out".play("fadeout")


func _on_button_button_down():
	$button1/Buttons.modulate = Color(0.637, 0.38, 0.245, 1.0)


func _on_fade_in_out_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().change_scene_to_file("res://main.tscn")
