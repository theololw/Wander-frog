extends Node2D

var signalStrength = 0
var i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$goal.position =Vector2(randi_range(250,2250),randi_range(250,2250))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i = 0
	for pip in get_tree().get_nodes_in_group("pip"):
		$Camera2D/signal_circle/Line2D.set_point_position(i,pip.global_position-$Camera2D/signal_circle.global_position)
		i += 1
		
		if i%2==0:
			pip.position.x = signalStrength/2+75
		else:
			pip.position.x = -signalStrength/2+75
	
	$goal.rotation += 0.4 * delta
	
	$Camera2D/signal_circle.rotation += 0.2*delta
	
	$Camera2D.position += (get_global_mouse_position() - $Camera2D.global_position) * delta
	
	signalStrength = $Camera2D.global_position.distance_to($goal.global_position)
	signalStrength /= 25
	
	$AudioStreamPlayer.volume_linear = signalStrength/50
	
	if $Camera2D/signal_circle.global_position.distance_to($goal.global_position) < 50:
		$animation.play("zoom out")


func _on_animation_animation_finished(anim_name):
	Global.musicStage += 1
	get_tree().change_scene_to_file("res://main.tscn")
