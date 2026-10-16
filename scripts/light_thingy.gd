extends Node2D

var lighted = false
var inPlayerWatcher1 = false
var inPlayerWatcher2 = false

var direction = "up"


func _ready():
	$lightHitbox/CollisionPolygon2D.disabled = true
	$lightHitbox2/CollisionPolygon2D.disabled = true

func _process(delta):
	var overlappingLightAreas = $light_receptor.get_overlapping_areas()
	if overlappingLightAreas.size() > 0:
		lighted = true
		print(overlappingLightAreas)
	else:
		lighted = false
	
	var overlappingWatcher1Bodies = $watcher1.get_overlapping_bodies()
	if overlappingWatcher1Bodies.size() > 0:
		inPlayerWatcher1 = true
	else:
		inPlayerWatcher1 = false
		
	var overlappingWatcher2Bodies = $watcher2.get_overlapping_bodies()
	if overlappingWatcher2Bodies.size() > 0:
		inPlayerWatcher2 = true
	else:
		inPlayerWatcher2 = false


	if inPlayerWatcher1 and lighted:
		$light_receptor/PointLight2.show()
		$lightHitbox/CollisionPolygon2D.disabled = false
	if inPlayerWatcher2 and lighted:
		$light_receptor/PointLight1.show()
		$lightHitbox2/CollisionPolygon2D.disabled = false
	
	
	if not inPlayerWatcher1:
		$light_receptor/PointLight2.hide()
		$lightHitbox/CollisionPolygon2D.disabled = true
	if not inPlayerWatcher2:
		$light_receptor/PointLight1.hide()
		$lightHitbox2/CollisionPolygon2D.disabled = true
	if not lighted:
		$light_receptor/PointLight2.hide()
		$lightHitbox2/CollisionPolygon2D.disabled = true
		$light_receptor/PointLight1.hide()
		$lightHitbox/CollisionPolygon2D.disabled = true
