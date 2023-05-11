extends Node2D

func _on_start_button_pressed():
	get_tree().change_scene("res://Scenes/Start.tscn")
	if get_tree().change_scene("res://Scenes/Start.tscn") != OK:
		print("Scene Tidak Ada")

func _on_about_button_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
	if get_tree().change_scene("res://Scenes/About.tscn") != OK:
		print("Scene Tidak Ada")

func _on_exit_button_pressed():
	get_tree().quit()
