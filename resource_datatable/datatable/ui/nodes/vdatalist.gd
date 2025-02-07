@tool
extends VBoxContainer
class_name VDataList

var data_type: int
var data_name: String

func init_category(data: Dictionary) -> void:
	data_type = data["type"]
	data_name = data["name"]
	add_data(data, null, true)


## data: 属性字典 is_category: 是否是目录
func add_data(data: Dictionary, resource: Variant = null, category: bool = false) -> void:
	data_type = data["type"]
	data_name = data["name"]
	
	##把引擎内置变量类型转化为DT变量类型
	var dt = DT_Schema.get_instance().gdType_to_plugType(data_type)
	
	##根据DT变量类型获取主题UI
	var schema_scene = DT_Schema.get_instance().get_schema(dt)
	if schema_scene:
		##实例化后添加到节点树
		var schema = schema_scene.instantiate()
		add_child(schema)
		
		##要延迟调用
		schema.call_deferred("set_type", dt) 
		schema.call_deferred("set_title", data_name) 
		schema.call_deferred("set_resource", resource) 
		schema.call_deferred("set_disabled", category)
		if resource:
			var value = PropertyHelper.get_property(resource, data_name)
			schema.call_deferred("set_value", value)
		
##保存数据
func save_data():
	for schema in get_children():
		schema.save()
		
