tool
extends Control

export(String, FILE, "*.tscn") var menu_inicial = ""

func _get_configuration_warning() -> String:
	if menu_inicial == "":
		return "No hay menu inicial asignado"
	
	return ""

func cargar_menu() ->void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_inicial) 
