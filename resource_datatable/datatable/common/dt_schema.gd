@tool
extends DT_Common
class_name DT_Schema

var invalid_schema: Resource
var string_schema: Resource
var int_schema: Resource
var float_schema: Resource
var color_schema: Resource
var vector2_schema: Resource
var vector3_schema: Resource
var vector4_schema: Resource
var t2_schema: Resource
var t3_schema: Resource
var array_schema: Resource
var bool_schema: Resource
var ress_schema: Resource
var quat_schema: Resource
var plane_schema: Resource
var rect_schema: Resource
var aabb_schema: Resource
var basis_schema: Resource
var proj_schema: Resource
var dict_schema: Resource
var dict_item_schema: Resource

var custom_schema: Dictionary

static var _INSTANCE: DT_Schema

static func delete():
	_INSTANCE = null

static func get_instance() -> DT_Schema:
	
	if !_INSTANCE:
		_INSTANCE = DT_Schema.new()
		_INSTANCE.load_var()
	
	return _INSTANCE

func load_var():
	invalid_schema = preload("res://addons/resource_datatable/datatable/ui/schema/invalid_schema.tscn")
	string_schema = preload("res://addons/resource_datatable/datatable/ui/schema/string_schema.tscn")
	int_schema = preload("res://addons/resource_datatable/datatable/ui/schema/int_schema.tscn")
	float_schema = preload("res://addons/resource_datatable/datatable/ui/schema/float_schema.tscn")
	color_schema = preload("res://addons/resource_datatable/datatable/ui/schema/color_schema.tscn")
	vector2_schema = preload("res://addons/resource_datatable/datatable/ui/schema/vector_2_schema.tscn")
	vector3_schema = preload("res://addons/resource_datatable/datatable/ui/schema/vector_3_schema.tscn")
	vector4_schema = preload("res://addons/resource_datatable/datatable/ui/schema/vector_4_schema.tscn")
	t2_schema = preload("res://addons/resource_datatable/datatable/ui/schema/t_2_schema.tscn")
	t3_schema = preload("res://addons/resource_datatable/datatable/ui/schema/t_3_schema.tscn")
	array_schema = preload("res://addons/resource_datatable/datatable/ui/schema/array_schema.tscn")
	bool_schema = preload("res://addons/resource_datatable/datatable/ui/schema/bool_schema.tscn")
	ress_schema = preload("res://addons/resource_datatable/datatable/ui/schema/ress_schema.tscn")
	quat_schema = preload("res://addons/resource_datatable/datatable/ui/schema/quat_schema.tscn")
	plane_schema = preload("res://addons/resource_datatable/datatable/ui/schema/plane_schema.tscn")
	rect_schema = preload("res://addons/resource_datatable/datatable/ui/schema/rect_schema.tscn")
	aabb_schema = preload("res://addons/resource_datatable/datatable/ui/schema/aabb_schema.tscn")
	basis_schema = preload("res://addons/resource_datatable/datatable/ui/schema/basis_schema.tscn")
	proj_schema = preload("res://addons/resource_datatable/datatable/ui/schema/proj_schema.tscn")
	dict_schema = preload("res://addons/resource_datatable/datatable/ui/schema/dict_schema.tscn")
	dict_item_schema = preload("res://addons/resource_datatable/datatable/ui/schema/dict_item_schema.tscn")

func each() -> Array:
	return [
		invalid_schema,
		string_schema,
		int_schema,
		float_schema,
		color_schema,
		vector2_schema,
		vector3_schema,
		vector4_schema,
		t2_schema,
		t3_schema,
		array_schema,
		bool_schema,
		ress_schema,
		quat_schema,
		plane_schema,
		rect_schema,
		aabb_schema,
		basis_schema,
		proj_schema
	]

func get_schema(schema_type: int) -> Resource:
	match(schema_type):
		self.TYPE_INVALID:
			return invalid_schema
		self.TYPE_STRING:
			return string_schema
		self.TYPE_INT:
			return int_schema
		self.TYPE_FLOAT:
			return float_schema
		self.TYPE_COLOR:
			return color_schema
		self.TYPE_VECTOR2:
			return vector2_schema
		self.TYPE_VECTOR3:
			return vector3_schema
		self.TYPE_VECTOR4:
			return vector4_schema
		self.TYPE_T2:
			return t2_schema
		self.TYPE_T3:
			return t3_schema
		self.TYPE_BOOL:
			return bool_schema
		self.TYPE_RESS:
			return invalid_schema
			#return ress_schema
		self.TYPE_QUAT:
			return quat_schema
		self.TYPE_PLANE:
			return plane_schema
		self.TYPE_RECT:
			return rect_schema
		self.TYPE_AABB:
			return aabb_schema
		self.TYPE_BASIS:
			return basis_schema
		self.TYPE_PROJ:
			return proj_schema
		self.TYPE_DICT:
			return dict_schema
		self.TYPE_DICT_ITEM:
			return dict_item_schema
		_:
			#ASSERT_ERROR(str("No schema for the type: ", schema_type))
			return invalid_schema
			

func get_icon(schema_type: int) -> String:
	match(schema_type):
		self.TYPE_INVALID:
			return INVALID_ICON
		self.TYPE_STRING:
			return STR_ICON
		self.TYPE_INT:
			return INT_ICON
		self.TYPE_FLOAT:
			return FLOAT_ICON
		self.TYPE_COLOR:
			return COLOR_ICON
		self.TYPE_VECTOR2:
			return V2_ICON
		self.TYPE_VECTOR3:
			return V3_ICON
		self.TYPE_VECTOR4:
			return V4_ICON
		self.TYPE_T2:
			return T2_ICON
		self.TYPE_T3:
			return T3_ICON
		self.TYPE_BOOL:
			return BOOL_ICON
		self.TYPE_RESS:
			return RESS_ICON
		self.TYPE_QUAT:
			return QUAT_ICON
		self.TYPE_PLANE:
			return PLANE_ICON
		self.TYPE_RECT:
			return RECT_ICON
		self.TYPE_AABB:
			return AABB_ICON
		self.TYPE_BASIS:
			return BASIS_ICON
		self.TYPE_PROJ:
			return PROJ_ICON
		self.TYPE_DICT:
			return DICT_ICON
		_:
			ASSERT_ERROR(str("No icon for the type: ", schema_type))
			return ""

# Convert the engine type id to the plugin type id
func gdType_to_plugType(GDType: int):
	match(GDType):
		Variant.Type.TYPE_STRING:
			return self.TYPE_STRING
		Variant.Type.TYPE_INT:
			return self.TYPE_INT
		Variant.Type.TYPE_FLOAT:
			return self.TYPE_FLOAT
		Variant.Type.TYPE_COLOR:
			return self.TYPE_COLOR
		Variant.Type.TYPE_VECTOR2:
			return self.TYPE_VECTOR2
		Variant.Type.TYPE_VECTOR3:
			return self.TYPE_VECTOR3
		Variant.Type.TYPE_VECTOR4:
			return self.TYPE_VECTOR4
		Variant.Type.TYPE_TRANSFORM2D:
			return self.TYPE_T2
		Variant.Type.TYPE_TRANSFORM3D:
			return self.TYPE_T3
		Variant.Type.TYPE_BOOL:
			return self.TYPE_BOOL
		Variant.Type.TYPE_OBJECT:
			return self.TYPE_RESS
		Variant.Type.TYPE_QUATERNION:
			return self.TYPE_QUAT
		Variant.Type.TYPE_AABB:
			return self.TYPE_AABB
		Variant.Type.TYPE_BASIS:
			return self.TYPE_BASIS
		Variant.Type.TYPE_PLANE:
			return self.TYPE_PLANE
		Variant.Type.TYPE_RECT2:
			return self.TYPE_RECT
		Variant.Type.TYPE_TRANSFORM2D:
			return self.TYPE_T2
		Variant.Type.TYPE_TRANSFORM3D:
			return self.TYPE_T3
		Variant.Type.TYPE_DICTIONARY:
			return self.TYPE_DICT
		_:
			WARNING(str("No type for the GDType: ", GDType, ". This message can be ignored if you imported a custom resource."))
			return self.TYPE_INVALID

func gdSize_to_plugSize(GDSize: int):
	var array_gdsize = [
		Variant.Type.TYPE_PACKED_INT32_ARRAY,
		Variant.Type.TYPE_PACKED_INT64_ARRAY,
		Variant.Type.TYPE_PACKED_FLOAT32_ARRAY,
		Variant.Type.TYPE_PACKED_FLOAT64_ARRAY,
		Variant.Type.TYPE_PACKED_STRING_ARRAY,
		Variant.Type.TYPE_PACKED_VECTOR2_ARRAY,
		Variant.Type.TYPE_PACKED_VECTOR3_ARRAY,
		Variant.Type.TYPE_PACKED_COLOR_ARRAY,
		Variant.Type.TYPE_ARRAY
	]

	if array_gdsize.has(GDSize):
		return self.SIZE_ARRAY
	else:
		return self.SIZE_SINGLE

func gdArray_to_plugType(GDArray: int):
	match(GDArray):
		Variant.Type.TYPE_PACKED_INT32_ARRAY:
			return self.TYPE_INT
		Variant.Type.TYPE_PACKED_INT64_ARRAY:
			return self.TYPE_INT
		Variant.Type.TYPE_PACKED_FLOAT32_ARRAY:
			return self.TYPE_FLOAT
		Variant.Type.TYPE_PACKED_FLOAT64_ARRAY:
			return self.TYPE_FLOAT
		Variant.Type.TYPE_PACKED_STRING_ARRAY:
			return self.TYPE_STRING
		Variant.Type.TYPE_PACKED_VECTOR2_ARRAY:
			return self.TYPE_VECTOR2
		Variant.Type.TYPE_PACKED_VECTOR3_ARRAY:
			return self.TYPE_VECTOR3
		Variant.Type.TYPE_PACKED_COLOR_ARRAY:
			return self.TYPE_COLOR

# func gdArray_to_plugArray(GDArray: String) -> String:

# 	var is_packed: bool = false
# 	var array: String = ""

# 	if GDArray.contains("Packed"):
# 		is_packed = true
	
# 	if is_packed:
# 		var temp = GDArray.split("Array(")[1].split(",")

# 		array = "["

# 		for i in temp.size():
# 			array += str(temp[i].strip())
# 			if i < temp.size() - 1:
# 				array += ", "
		
# 		array += "]"

# 	else:
# 		array = GDArray
	
# 	return array

# [W.I.P] Add a custom schema

func add_custom(schema_name: String, schema_path: String) -> bool:
	
	if custom_schema.has(schema_name):
		ERROR("Can't add a schema with the same name as another one")
		return false
	
	custom_schema[schema_name] = load(schema_path)
	
	return true
