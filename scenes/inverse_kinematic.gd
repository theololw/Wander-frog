extends Node2D

var legLength = 100
@export var goalPosition = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$goal.global_position = global_position + goalPosition
	
	if $base.global_position.distance_to($goal.global_position) < 200:
		$joint.position.x = $goal.position.x/2
		$joint.position.y = sqrt(legLength*legLength-($goal.position.x/2)*($goal.position.x/2))
		$Line2D.set_point_position(1,$joint.position)
		$Line2D.set_point_position(2,$goal.position)
	
	look_at(goalPosition)
	
	
	
	
