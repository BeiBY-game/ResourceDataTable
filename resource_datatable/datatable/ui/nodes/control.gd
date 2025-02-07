@tool
extends Control

@export var file_path: String = "res://"

@export var file_name: String = ".tres"

@export var class_script: String = ""

func _on_add_resource_button_button_down() -> void:
	visible = true


func _on_confirm_start_to_add_file(_path: String, _name: String) -> void:
	pass # Replace with function body.
