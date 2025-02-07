@tool
extends EditorPlugin

var datatableDock: Node

@onready var common: Node

const tab_icon = preload("res://addons/resource_datatable/datatable//icons/tab_icon.svg")
const tab_path = "res://addons/resource_datatable/datatable//ui/nodes/data_table.tscn"

func _enter_tree():
	datatableDock = preload(tab_path).instantiate()
	
	_add_data_table_dock()
	datatableDock.hide()
	
	#common = datatableDock.get_node('signals')
	
	DT_Interface.get_instance().set_main(datatableDock)
	
	print("[DataTable] => Plugin is enabled!")
	
	DT_Plugin.get_instance().plugin_on.emit()

func _exit_tree():
	DT_Plugin.get_instance().plugin_off.emit()
	
	_remove_data_table_dock()
	
	print("[DataTable] => Plugin is disabled!")
	
	DT_Plugin.get_instance().delete()
	DT_Interface.get_instance().delete()
	DT_Schema.get_instance().delete()
	DT_ClassGenerator.get_instance().delete()
	pass

func _has_main_screen():
	return true

func _get_plugin_name():
	return "DataTable"

func _get_plugin_icon():
	return tab_icon

func _make_visible(visible):
	if is_instance_valid(datatableDock):
		datatableDock.visible = visible
		#if visible:
			#datatableDock.check_for_datatable_change()

func _add_data_table_dock():
	get_editor_interface().get_editor_main_screen().add_child(datatableDock)

func _remove_data_table_dock():
	datatableDock.queue_free()
