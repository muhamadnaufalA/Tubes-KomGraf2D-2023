extends TextureButton

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Start.tscn")
	if get_tree().change_scene("res://Scenes/Start.tscn") != OK:
		print("Scene Tidak Ada")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Animasi.tscn")
	if get_tree().change_scene("res://Scenes/Animasi.tscn") != OK:
		print("Scene Tidak Ada")
