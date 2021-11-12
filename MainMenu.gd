extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $HBoxContainer/VBoxContainer2/TextureButton.is_hovered() == true:
		$HBoxContainer/VBoxContainer2/TextureButton.grab_focus()
	elif $HBoxContainer/VBoxContainer2/TextureButton2.is_hovered() == true:
		$HBoxContainer/VBoxContainer2/TextureButton2.grab_focus()
	elif $HBoxContainer/VBoxContainer2/TextureButton3.is_hovered() == true:
		$HBoxContainer/VBoxContainer2/TextureButton3.grab_focus()
		
	pass



func _on_TextureButton_pressed():
	get_tree().change_scene("res://NewWorld.tscn")

func _on_TextureButton2_pressed():
	OS.shell_open("http://godotengine.org")

func _on_TextureButton3_pressed():
	get_tree().quit()
