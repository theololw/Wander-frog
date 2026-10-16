extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $RayCast2D.is_colliding():
		var origin = $RayCast2D.global_transform.origin
		var collision_point = $RayCast2D.get_collision_point()
		var distance = origin.distance_to(collision_point)
		$lightHitbox.scale = Vector2(distance/380,distance/380)
