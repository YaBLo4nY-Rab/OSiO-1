extends Control

var file_selecting: int

var thread1: Thread
var thread2: Thread
var thread3: Thread
var thread4: Thread
var thread5: Thread


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


func _calculate_hash(data):
	print("Start thread ", data)
	var path: String
	var md5_hash: String
	
	var file_number = int(data)
	
	if file_number == 1:
		path = $MarginContainer/VBoxContainer/HBoxContainer/LineEdit.text
	elif file_number == 2:
		path = $MarginContainer/VBoxContainer/HBoxContainer2/LineEdit.text
	elif file_number == 3:
		path = $MarginContainer/VBoxContainer/HBoxContainer3/LineEdit.text
	elif file_number == 4:
		path = $MarginContainer/VBoxContainer/HBoxContainer4/LineEdit.text
	elif file_number == 5:
		path = $MarginContainer/VBoxContainer/HBoxContainer5/LineEdit.text
	
	var f := File.new()
	f.open(path, File.READ)
	md5_hash = f.get_as_text().md5_text()
	f.close()
	
	print(123123)
	print(path)
	print(md5_hash)
	
	if file_number == 1:
		$MarginContainer2/HBoxContainer/VBoxContainer/LineEdit.text = md5_hash
	elif file_number == 2:
		$MarginContainer2/HBoxContainer/VBoxContainer2/LineEdit.text = md5_hash
	elif file_number == 3:
		$MarginContainer2/HBoxContainer/VBoxContainer3/LineEdit.text = md5_hash
	elif file_number == 4:
		$MarginContainer2/HBoxContainer/VBoxContainer4/LineEdit.text = md5_hash
	elif file_number == 5:
		$MarginContainer2/HBoxContainer/VBoxContainer5/LineEdit.text = md5_hash
	
	print("End thread ", data)
	


func _on_ButtonCalculate_pressed():
	thread1 = Thread.new()
	thread1.start(self, "_calculate_hash", "1")
	
	thread2 = Thread.new()
	thread2.start(self, "_calculate_hash", "2")
	
	thread3 = Thread.new()
	thread3.start(self, "_calculate_hash", "3")
	
	thread4 = Thread.new()
	thread4.start(self, "_calculate_hash", "4")
	
	thread5 = Thread.new()
	thread5.start(self, "_calculate_hash", "5")


func _exit_tree():
	thread1.wait_to_finish()
	thread2.wait_to_finish()
	thread3.wait_to_finish()
	thread4.wait_to_finish()
	thread5.wait_to_finish()
