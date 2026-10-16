extends Node2D

var sensingD1 = false
var sensingD2 = false
var sensingLight = false

func senseD1():
	var overlappingBodies = $pivot/direction_sensor_1.get_overlapping_bodies()
	if overlappingBodies.size() > 0:
		sensingD1 = true
	else:
		sensingD1 = false
func senseD2():
	var overlappingBodies = $pivot/direction_sensor_2.get_overlapping_bodies()
	if overlappingBodies.size() > 0:
		sensingD2 = true
	else:
		sensingD2 = false
func senseLight():
	var overlappingAreas = $pivot/light_sensor.get_overlapping_areas()
	if overlappingAreas.size() > 0:
		sensingLight = true
		for area in overlappingAreas:
			print(area.get_parent().global_position)
	else:
		sensingLight = false
func hideLights():
	$pivot/light_2/PointLight2D.hide()
	$pivot/light_1/PointLight2D.hide()

func _process(delta):
	senseD1()
	senseD2()
	senseLight()
