class_name StatModifier extends Pipe

var type: String

func _init(_type: String, _base: float = 0, _sourcename: String = "") -> void:
	super(_base)
	type = _type
	if _sourcename: name = _sourcename

func add(coupling: Pipe) -> bool:
	if not coupling is StatModifier or get_children().has(coupling): return false
	if coupling.is_inside_tree(): coupling = StatModifier.new(coupling.type, coupling.base, coupling.name)
	add_child(coupling)
	_dirty = true
	return true

static func Modifiers() -> Dictionary[String, Variant]:
	return {}

static func Serialize(mod: StatModifier) -> Dictionary:
	return {"type": mod.type, "base": mod.base}

static func Deserialize(data: Dictionary) -> StatModifier:
	return Modifiers()[data.type].new(data.type, data.base)
