extends Control



func _process(delta):
	$VBoxContainer/Label.text = String(Global.total_match)
