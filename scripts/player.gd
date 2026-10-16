extends CharacterBody2D

@export var speed = 100
@export var camera_enabled = true

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	$direction.position = velocity
	
	if abs(velocity.x) + abs(velocity.y) != 0:
		$AnimationPlayer.play("runnin")
		$Frog.look_at($direction.global_position)
		$flashlight/Flashlight.hide()
	else:
		$AnimationPlayer.play("sittin")
		$Frog.rotation = 0
		$flashlight/Flashlight.show()
	
	if Input.is_action_just_pressed("mow"):
		$mow.pitch_scale = randf_range(0.5,1.25)
		$mow.play()
	
	

func _physics_process(delta):
	if Global.introDone:
		get_input()
	move_and_slide()
	
	if Input.is_action_pressed("light") and Global.ending == false and Global.introDone == true:
		$flashlight.show()
		$flashlight/lightHitbox.position = Vector2(0,0)
	else:
		$flashlight.hide()
		$flashlight/lightHitbox.position = Vector2(5000,5000)
	$flashlight.look_at(get_global_mouse_position())
	
	if camera_enabled:
		$Camera2D.enabled = true
	else:
		$Camera2D.enabled = false
	
	if Input.is_action_just_pressed("stuck"):
		global_position = Vector2(176,-8)
	
	Global.playerPosition = global_position
	
	if global_position != Vector2(176,-8):
		$CanvasLayer.hide()


func _on_wasd_timer_timeout():
	if global_position == Vector2(176,-8):
		$CanvasLayer.show()
