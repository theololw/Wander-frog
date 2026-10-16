extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Rock.frame = randi_range(0,3)
