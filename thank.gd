extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if $VBoxContainer/HBoxContainer/TextureButton.is_hovered() == true:
		$VBoxContainer/HBoxContainer/TextureButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
