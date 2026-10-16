extends Node2D

var doorspeed = 35
var doorOpen = false

func openDoor():
	doorOpen = true
func closeDoor():
	doorOpen = false
		
func _physics_process(delta):
	if doorOpen == true:
		if $leftdoor.position.x > -32:
			$leftdoor.position.x -= doorspeed*delta
		if $rightdoor.position.x < 160:
			$rightdoor.position.x += doorspeed*delta
	if doorOpen == false:
		if $leftdoor.position.x < 0:
			$leftdoor.position.x += doorspeed*delta
		if $rightdoor.position.x > 128:
			$rightdoor.position.x -= doorspeed*delta
