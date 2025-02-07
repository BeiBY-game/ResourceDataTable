@tool
extends Label

@onready var input: LineEdit = $"../../HBoxContainer2/InputClassName"

func _on_generate_data_table_button_down() -> void:
	if DT_ClassDB.class_exist(input.text):
		text = input.text
		add_theme_color_override("font_color", Color.AZURE)
		
	else:
		add_theme_color_override("font_color", Color.CRIMSON)
		text = "全局类：%s 不存在!" % input.text

func _on_clear_class_button_button_down() -> void:
	text = "检查全局类合法性"
	add_theme_color_override("font_color", Color.AZURE)
