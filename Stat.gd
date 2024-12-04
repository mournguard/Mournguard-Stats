class_name Stat extends Pipe

func add(coupling: Pipe) -> bool:
	if get_children().has(coupling) or not coupling is StatModifier:
		return false
	add_child(StatModifier.deserialize(StatModifier.serialize(coupling)))
	return true
