@tool
extends Resource
class_name TestItem

@export var id: int = -1
@export var item_name: String = "物品名称"
@export var icon: Texture2D
@export var description: String = "物品描述"
@export var can_use: bool = false
