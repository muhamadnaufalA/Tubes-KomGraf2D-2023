extends Node2D

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
		print("Scene Tidak Ada")
