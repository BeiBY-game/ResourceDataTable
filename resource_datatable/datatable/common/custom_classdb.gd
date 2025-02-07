@tool
extends DT_Common
## 自定义ClassDB 是因为默认的ClassDB没法识别用户自定义Class
class_name DT_ClassDB

##全局类是否存在
static func class_exist(className: String) -> bool:
	
	var arr = ProjectSettings.get_global_class_list().filter(
		func(data: Dictionary):
			return data['class'] == className
	)
	
	if arr.size() != 0:
		return true
	
	push_error(str("Class '",className,"' doesn't exist!"))
	return false

##获取类自身的属性 不包括类内部的字段
static func get_class_data(className: String) -> Dictionary:
	
	if !class_exist(className):
		return {}
	
	var arr = ProjectSettings.get_global_class_list().filter(
		func(data: Dictionary):
			return data['class'] == className
	)
	
	if arr.size() != 1:
		push_error(str("Found Multiple?? class with name '",className,"'!"))
		return {}
	
	return arr[0]

##实例化
static func class_instantiate(className: String) -> Resource:
	
	if !class_exist(className):
		return null
	
	var classData = get_class_data(className)
	
	if classData == {}:
		return null
	
	if !classData.has('path'):
		push_error(str("Can't found key 'path' in class '",className,"'!"))
		return null
	
	if !classData.has('language'):
		push_error(str("Can't found key 'language' in class '",className,"'!"))
		return null
	
	if classData['language'] != 'GDScript':
		push_error(str("The class '",className,"' isn't a GDScript class!"))
		return null
	
	var script: GDScript = load(classData['path'])
	
	return script

##获取所有第一级派生子类类名
static func get_direct_child(className: String) -> Array:

	var arr = []

	for i in ProjectSettings.get_global_class_list():
		if i['base'] == className:
			arr.append(str(i['class']))
	
	return arr
