extends Node2D


@export var door: Node
var sent_signal = false

func _on_light_sensor_area_entered(area):
	door.openDoor()
	$LightSensor.frame = 1
func _on_light_sensor_area_exited(area):
	door.closeDoor()
	$LightSensor.frame = 0
