class_name Stats extends Component
static func get_type() -> Variant: return Stats

func _get(property: StringName) -> Pipe:
	for c in get_children():
		if c.name == property and c is Pipe:
			return c
	return null

func _clear() -> void:
	for c in get_children():
		remove_child(c)
		c.queue_free()
