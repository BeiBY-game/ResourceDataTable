@tool
extends HBoxContainer
class_name HDataList

var vcontainer = preload("res://addons/resource_datatable/datatable/ui/nodes/v_box_container.tscn")

@onready var data_table: DataTable = $"../../.."

##属性名称：对应UI垂直容器
var container_lists: Dictionary = {}

##数据表已全部保存
signal all_data_saved

func generate_data_table() -> void:
	if not data_table:
		return
		
	clear_data_table()
	
	init_category()
	
	add_resource_data()

##初始化属性目录
func init_category() -> void:
	for prop in data_table.custom_prop_list:
		var list: VDataList = vcontainer.instantiate()
		list.init_category(prop)
		add_child(list)
		container_lists[prop["name"]] = list
		
##添加每个资源的数据
func add_resource_data() -> void:
	for path in data_table.resource_map.keys():
		var resource = data_table.resource_map[path]
		var props = PropertyHelper.get_custom_property_list(resource)
		
		for prop in props:
			var _name = prop["name"]
			if container_lists.has(_name):
				var container = container_lists[_name]
				container.add_data(prop, resource, false)

##清除列表				
func clear_data_table() -> void:
	for node in get_children():
		node.queue_free()
	
	container_lists.clear()
	
##保存数据
func save_data_table() -> void:
	for node in get_children():
		node.save_data()
	
	all_data_saved.emit()

func _on_data_table_resource_complete() -> void:
	generate_data_table()

func _on_save_data_table_button_down() -> void:
	save_data_table()

func _on_clear_class_button_button_down() -> void:
	clear_data_table()
