@tool
extends Button

@onready var add_file: Control = $"../../../.."

func _on_button_down() -> void:
	add_file.visible = false
	
