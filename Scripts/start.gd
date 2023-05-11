extends Node2D

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
		print("Scene Tidak Ada")

func _on_CustomButton_pressed():
	get_tree().change_scene("res://Scenes/Custom.tscn")
	if get_tree().change_scene("res://Scenes/Custom.tscn") != OK:
		print("Scene Tidak Ada")

func _on_AnimasiButton_pressed():
	get_tree().change_scene("res://Scenes/Animasi.tscn")
	if get_tree().change_scene("res://Scenes/Animasi.tscn") != OK:
		print("Scene Tidak Ada")
