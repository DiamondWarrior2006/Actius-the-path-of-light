extends Control



func _ready():
	$Panel/TabContainer/Programmer/VBoxContainer/HBoxContainer/DWYouTube.grab_focus()



# My socials
func _on_DWYouTube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCznHqdFIOWxrzc5uHdJ8iYw")


func _on_DWTwitter_pressed():
	OS.shell_open("https://twitter.com/Diamond70000744")


func _on_DWInstagram_pressed():
	OS.shell_open("https://www.instagram.com/diamondwarrior06/")

# Moustronaut's socials
func _on_MSoundcloud_pressed():
	OS.shell_open("https://soundcloud.com/h-i-x-i-s")

func _on_MYouTube_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCQOsZhIJYBLnFKDtuczfh9Q")

func _on_MTwitter_pressed():
	OS.shell_open("https://twitter.com/Moustronaut")
