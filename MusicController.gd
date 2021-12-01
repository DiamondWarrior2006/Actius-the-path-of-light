extends AudioStreamPlayer

var title_screen = load("res://Music/GameJamTitleScreenMP3.mp3")
var level_one = load("res://Music/GameJam1MP3.mp3")
var level_two = load("res://Music/GameJam2MP3.mp3")
var level_three = load("res://Music/GameJam3MP3.mp3")
var ending_theme = load("res://Music/GameJam4MP3.mp3")
var water_driping = load("res://Sounds/water driping.mp3")

func play_title_screen():
	stream = title_screen
	play()
	volume_db = -5

func play_level_one():
	stream = level_one
	play()
	volume_db = -5

func play_level_two():
	stream = level_two
	play()
	volume_db = -5

func play_level_three():
	stream = level_three
	play()
	volume_db = -5

func play_end_screen():
	stream = ending_theme
	play()
	volume_db = -5

func stop_music():
	stop()
