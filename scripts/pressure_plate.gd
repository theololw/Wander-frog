extends Area2D

@export var door: Node
var previous_overlapping_bodies = 0



func _on_check_overlapping_timeout():
	if get_overlapping_bodies().size() > previous_overlapping_bodies and get_overlapping_bodies().size()>0:
		door.openDoor()
	elif get_overlapping_bodies().size() < previous_overlapping_bodies and get_overlapping_bodies().size()<1:
		door.closeDoor()
	if get_overlapping_bodies().size() > 0:
		$texture.frame = 1
	else:
		$texture.frame = 0
	
	previous_overlapping_bodies = get_overlapping_bodies().size()
	
