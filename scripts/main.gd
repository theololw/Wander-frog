extends Node2D

func musicStage1Actions():
	$blockades/firstMusic/CollisionShape2D.disabled = false
	$trees2/tree188.queue_free()
	$trees2/tree186.queue_free()
	$trees2/tree.queue_free()
	$trees2/tree7.queue_free()
	$trees2/tree197.queue_free()
	$blockades/firstMusic/CollisionShape2D2.disabled = false
	$blockades/firstMusic/trees/LeaflessTree.show()
	$blockades/firstMusic/trees/LeaflessTree2.show()
	

func musicStage2Actions():
	$blockades/secondMusic/CollisionShape2D.disabled = false
	$blockades/firstMusic/CollisionShape2D3.disabled = true
	$trees2/tree215.queue_free()
	$blockades/secondMusic/trees/LeaflessTree.hide()
	$blockades/secondMusic/trees/LeaflessTree2.hide()
	

func musicStage3Actions():
	$trees2/tree15.queue_free()
	$trees2/tree14.queue_free()
	$trees2/tree193.queue_free()
	$blockades/thirdMusic/CollisionShape2D.disabled = false

func _ready():
	if not Global.introDone:
		$opening.play("opening")
		 
	if Global.musicStage == 1:
		musicStage1Actions()
		$player.position = Vector2(48,-304)
	
	if Global.musicStage == 2:
		musicStage1Actions()
		musicStage2Actions()
		$player.position = Vector2(256,-1056)
	
	if Global.musicStage == 3:
		musicStage1Actions()
		musicStage2Actions()
		musicStage3Actions()
		$player.position = Vector2(720,-96)


func _on_opening_animation_finished(anim_name):
	Global.introDone = true


func _on_player_catcher_body_entered(body):
	if Global.musicStage == 3:
		Global.ending = true
		$"ending cutscenes/ending".play("ending")


func _on_ending_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
