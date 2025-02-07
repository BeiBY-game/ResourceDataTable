@tool
extends Button

@onready var add_file: Control = $"../../../.."

@onready var file_path_input: LineEdit = $"../../PathInput"
@onready var file_name_input: LineEdit = $"../../FileNameInput"

signal start_to_add_file(_path: String, _name: String)

func _on_button_down() -> void:
	add_file.file_path = file_path_input.text
	add_file.file_name = file_name_input.text
	add_file.visible = false
	
	start_to_add_file.emit(add_file.file_path, add_file.file_name)
