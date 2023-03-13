extends Control

var file_selecting: int


func _ready():
	pass


func _on_FileDialog_file_selected(path):
	$MarginContainer/VBoxContainer/HBoxContainer/LineEdit.text = path

func _on_Button_pressed():
	file_selecting = 1
	
	$FileDialog.popup_centered()
	pass # Replace with function body.


func _on_Button2_pressed():
	file_selecting = 2
	$FileDialog.popup_centered()
	pass # Replace with function body.
