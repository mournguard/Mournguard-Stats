@tool
class_name Stats extends Component

@export var structure: StatStructure

func _get_configuration_requirements() -> Array[Variant]: return []

func _get(property: StringName) -> Variant:
	if !structure: return null
	if (property in structure and structure[property] is Stat):
		return structure[property].value
	else: return null

func _set(property: StringName, value: Variant) -> bool:
	if !structure: return true
	if (property in structure and structure[property] is Stat) and (value is float or value is int):
		structure[property].base = value
		return true
	return false

func _clear() -> void:
	for c in get_children():
		remove_child(c)
		c.queue_free()

func serialize_stat(stat: Stat) -> Dictionary:
	return {"type": stat.type, "base": stat.base, "source": stat.source}

func deserialize_stat(data: Dictionary) -> Stat:
	if !structure: return Stat.new(data.type, data.base, data.source)
	return structure.stats[data.type].new(data.type, data.base, data.source)
