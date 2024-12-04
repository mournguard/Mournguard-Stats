class_name StatModifier extends Pipe

var source: String
var type: String

func _init(_base: float, _type: String, _sourcename: String) -> void:
	super(_base)
	type = _type
	source = _sourcename if _sourcename else source

static func Modifiers() -> Dictionary[String, Variant]:
	return {}

static func Serialize(mod: StatModifier) -> Dictionary:
	return {"type": mod.type, "base": mod.base}

static func Deserialize(data: Dictionary) -> StatModifier:
	return Modifiers()[data.type].new(data.type, data.add)
