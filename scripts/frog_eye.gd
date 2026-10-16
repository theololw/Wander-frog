extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var overlaping_areas = $Area2D.get_overlapping_areas()
	if not Global.ending:
		if overlaping_areas.size() > 0:
			frame = 1
		else:
			frame = 0
