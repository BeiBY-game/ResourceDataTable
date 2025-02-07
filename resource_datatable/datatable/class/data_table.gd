@tool
class_name DataTable
extends MarginContainer

@export var input: LineEdit 

##当前搜索的类名
var className: StringName

##[资源路径：资源实例]
var resource_map: Dictionary

##类属性表
var custom_prop_list: Array

##资源已全部加载
signal resource_complete

func generate_class() -> void:
	clear_data_table()
	
	if not input:
		push_error("请重新激活DataTable插件")
		return
		
	if DT_ClassDB.class_exist(input.text):
		className = input.text
		
		generate_resource_map()
		generate_property_list()
		
		resource_complete.emit()

func generate_resource_map() -> void:
	##加载所有用户类的资源
	var resource_path = DT_FileAccess.get_resource_by_class(className)
	
	##加载每个资源的数据
	for path in resource_path:
		var resource: Resource = ResourceLoader.load(path)
		if resource:
			resource_map[path] = resource

func generate_property_list() -> void:	
	for resource in resource_map.values():
		custom_prop_list = PropertyHelper.get_custom_property_list(resource)
		
		return	

func save_data_table() -> void:
	for path in resource_map.keys():
		ResourceSaver.save(resource_map[path], path)

func clear_data_table() -> void:	
	resource_map.clear()
	
func _on_generate_data_table_button_down() -> void:
	generate_class()

func _on_h_box_container_all_data_saved() -> void:
	save_data_table()

func _on_clear_class_button_button_down() -> void:
	clear_data_table()

func _on_confirm_start_to_add_file(_path: String, _name: String) -> void:
	if resource_map.is_empty():
		push_error("未生成DataTable!")
		return
		
	if DT_FileAccess.check_file_valid(_path, _name):
		var resource = resource_map.values()[0].duplicate()
		ResourceSaver.save(resource, _path + _name)
		
	generate_class()
		
	
