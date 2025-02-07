@tool
class_name DT_FileAccess
extends EditorScript

const global_path = "res://"

##扫描路径下全部文件
static func scan(path: String = global_path) -> Array:
	var files := []
	var file_name := ""
	var dir := DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var sub_path = path + "/" + file_name
				files += scan(sub_path)
			else:
				var name := path + "/" + file_name
				files.push_back(name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		push_error("Failed to open:" + path)
		
	return files

##根据 尾缀类型 返回文件 suffix: .tres/.gd/.png
static func get_file_by_suffix(suffix: String, path: String = global_path) -> Array:
	
	var files: Array = scan(path).filter(func(file: String): 
		return file.contains(suffix))
	
	return files
	
##根据 全局类名 返回资源文件
static func get_resource_by_class(_class: String, path: String = global_path) -> Array:
	
	var files := []
	
	if not DT_ClassDB.class_exist(_class):
		return files
	
	var valid_files: Array = scan(path).filter(func(file: String):
		return ResourceLoader.exists(file)
		)
	
	files = valid_files.filter(func(file: String):
		var obj = ResourceLoader.load(file)
		if obj and obj.get_script():	
			return obj.get_script().get_global_name() == _class
		return false
		)
				
	return files
	
##根据 全局类名及该类的所有派生子类 返回资源文件
static func get_resource_by_class_and_children(_base_class: String, path: String = global_path) -> Array:
	var files := []
	
	if not DT_ClassDB.class_exist(_base_class):
		return files
		
	var _class_names:= DT_ClassDB.get_direct_child(_base_class)
	_class_names.append(_base_class)
	
	var valid_files: Array = scan(path).filter(func(file: String):
		return ResourceLoader.exists(file)
		)
	
	files = valid_files.filter(func(file: String):
		var obj = ResourceLoader.load(file)
		if obj and obj.get_script():
			for _class in _class_names:
				if obj.get_script().get_global_name() == _class:
					return true
		return false
		)
					
	return files	

static func check_file_valid(_path: String, _name: String) -> bool:
	var file_names = DT_FileAccess.scan(_path)
	
	var file_name_path = _path + "/" + _name
	
	if file_names.has(file_name_path):
		push_error("文件： %s 已存在！" % file_name_path)
		return false
	else:
		print("文件： %s 合法！" % file_name_path)
		return true
