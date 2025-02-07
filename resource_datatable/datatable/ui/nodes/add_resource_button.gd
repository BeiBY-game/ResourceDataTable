@tool
extends TextureButton

func _on_button_down() -> void:
	self_modulate = Color.DIM_GRAY


func _on_button_up() -> void:
	self_modulate = Color.WHITE
