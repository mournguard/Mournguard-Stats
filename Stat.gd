@tool
class_name Stat extends Pipe

var type: String
var source: String

func _init(_type: String, _base: Variant, _source: String) -> void:
	type = _type
	base = _base
	source = _source
	flush()

func add(coupling: Pipe) -> bool:
	if not coupling is Stat: return false
	return super(coupling)

func remove(coupling: Pipe) -> bool:
	if not coupling is Stat: return false
	return remove(coupling)
