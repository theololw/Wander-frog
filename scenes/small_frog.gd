extends Node2D


var currentRotation = 0

func _on_light_detector_area_entered(area):
	currentRotation += 90
	$Frog.rotation_degrees = currentRotation
	$Frog.frame = 1
func _on_light_detector_area_exited(area):
	$Frog.rotation_degrees = 0
	$Frog.frame = 0
