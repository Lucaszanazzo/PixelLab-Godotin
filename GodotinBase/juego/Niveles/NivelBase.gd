tool
extends Spatial

export var numero_nivel: int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""

func _ready() -> void:
	yield(get_tree().create_timer(4.0), "timeout")
	actualizar_datos()

func actualizar_datos() -> void:
	DatosJuego.nivel_actual = get_tree().current_scene.filename
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.proximo_nivel = proximo_nivel


func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "chequear valores de nivel"
	
	return ""
