extends CharacterBody2D

var speed = 50  # speed in pixels/sec
var direction = Vector2(-1,0)
var removable = false

func sense_tree():
	var overlappingBodies = $tree_sensor.get_overlapping_bodies()
	if removable:
		for body in overlappingBodies:
			if body.is_in_group("tree"):
				$AnimationPlayer.play("dissapear")
	
func _physics_process(delta):
	sense_tree()
	velocity = direction * speed
	$direction.position = direction
	$Frog.look_at($direction.global_position)

	move_and_slide()


func _on_light_sensor_area_entered(area):
	direction = direction.rotated(deg_to_rad(90))
	$mow.play()


func _on_invic_cooldown_timeout():
	removable = true


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "dissapear":
		queue_free()


func _on_live_time_timeout():
	$AnimationPlayer.play("dissapear")
