@tool
class_name PropertyHelper
extends EditorScript

## 获取脚本自定义属性列表
static func get_custom_property_list(obj: Object) -> Array:
	var property_list : Array = []
	for i in obj.get_property_list():
		# 这是一个 [自定义] 的属性 [usage] 则添加
		if is_custom_property(i["usage"]):
			property_list.append(i)
	return property_list

##返回变量是否是脚本自定义属性
static func is_custom_property(var_usage) -> bool:
	if var_usage & PROPERTY_USAGE_SCRIPT_VARIABLE:
		return true
	return false
	
##获取属性	找不到对应属性则返回null
static func get_property(obj: Object, prop: String) -> Variant:
	#if not obj.get(prop):
		#push_error("Get property: %s failed" % prop)
		
	return obj.get(prop)
	
##更改属性	修改成功返回true， 否则返回false
static func set_property(obj: Object, prop: String, new_var: Variant) -> bool:
	#var old_var = get_property(obj, prop)
	#if old_var:
		#and typeof(old_var) == typeof(new_var)
	obj.set(prop, new_var)
	return true
	
	#push_error("Set property: %s failed" % prop)
	#return false	
