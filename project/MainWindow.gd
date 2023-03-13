extends Control

var file_selecting: int


func _ready():
	pass


func _on_FileDialog_file_selected(path):
	print("file nimber", file_selecting)
	print(path)
	
	var size_f: String
	
	var f := File.new()
	f.open(path, File.READ)
	size_f = String(f.get_len())
	f.close()
	
	print(size_f)
	
	
	if file_selecting == 1:
		$MarginContainer/VBoxContainer/HBoxContainer/LineEdit.text = path
		$MarginContainer/VBoxContainer/HBoxContainer/LineEdit2.text = size_f
	elif file_selecting == 2:
		$MarginContainer/VBoxContainer/HBoxContainer2/LineEdit.text = path
		$MarginContainer/VBoxContainer/HBoxContainer2/LineEdit2.text = size_f
	elif file_selecting == 3:
		$MarginContainer/VBoxContainer/HBoxContainer3/LineEdit.text = path
		$MarginContainer/VBoxContainer/HBoxContainer3/LineEdit2.text = size_f
	elif file_selecting == 4:
		$MarginContainer/VBoxContainer/HBoxContainer4/LineEdit.text = path
		$MarginContainer/VBoxContainer/HBoxContainer4/LineEdit2.text = size_f
	elif file_selecting == 5:
		$MarginContainer/VBoxContainer/HBoxContainer5/LineEdit.text = path
		$MarginContainer/VBoxContainer/HBoxContainer5/LineEdit2.text = size_f

func _on_Button_pressed():
	file_selecting = 1
	$FileDialog.popup_centered()


func _on_Button2_pressed():
	file_selecting = 2
	$FileDialog.popup_centered()


func _on_Button3_pressed():
	file_selecting = 3
	$FileDialog.popup_centered()


func _on_Button4_pressed():
	file_selecting = 4
	$FileDialog.popup_centered()


func _on_Button5_pressed():
	file_selecting = 5
	$FileDialog.popup_centered()
