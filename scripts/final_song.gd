extends Node

func restart_song():
	$"bass notes".stop()
	$bass.stop()
	$chords.stop()
	$hat.stop()
	$kick.stop()
	$notes.stop()
	$trumpet.stop()
	$mow.stop()
	$final1.stop()
	$final2.stop()
	$"bass notes".play()
	$bass.play()
	$chords.play()
	$hat.play()
	$kick.play()
	$notes.play()
	$trumpet.play()
	$mow.play()
	$final1.play()
	$final2.play()
	

func full_song():
	$"bass notes".volume_db = 0
	$bass.volume_db = 0
	$chords.volume_db = -2
	$hat.volume_db = 0
	$kick.volume_db = 0
	$notes.volume_db = 0
	$trumpet.volume_db = 0
	$mow.volume_db = 0
	$final1.volume_db = 0
	$final2.volume_db = 0

func part1():
	$chords.volume_db = -2
	$mow.volume_db = 0

func part2():
	$chords.volume_db = -2
	$notes.volume_db = 0
	$"bass notes".volume_db = 0
	$mow.volume_db = 0

func part3():
	$chords.volume_db = -2
	$notes.volume_db = 0
	$"bass notes".volume_db = 0
	$bass.volume_db = 0
	$hat.volume_db = 0
	$kick.volume_db = 0
	$mow.volume_db = 0

func finale():
	$trumpet.volume_db = 0
func mute_song():
	$"bass notes".volume_db = -80
	$bass.volume_db = -80
	$chords.volume_db = -80
	$hat.volume_db = -80
	$kick.volume_db = -80
	$notes.volume_db = -80
	$trumpet.volume_db = -80
	$mow.volume_db = -80
	$final1.volume_db = -80
	$final2.volume_db = -80
# Called when the node enters the scene tree for the first time.
func _ready():
	mute_song()

func _process(delta):
	if get_tree().current_scene:
		if get_tree().current_scene.name == "main":
			if Global.musicStage == 0 and Global.introDone == true:
				$mow.volume_db = 0
			if Global.musicStage == 1:
				part1()
			if Global.musicStage == 2:
				part2()
			if Global.musicStage == 3:
				part3()
			if Global.ending == true:
				finale()
				$AnimationPlayer.play("finale")
		elif Global.ending == true:
			pass
		else:
			mute_song()




func _on_timer_timeout():
	restart_song()
