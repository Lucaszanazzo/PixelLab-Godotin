tool
extends Control

##Export var
export(String, FILE, "*.tscn") var menu_ajustes = ""
export(String, FILE, "*.tscn") var nivel_inial = ""
export(String, FILE, "*.tscn") var pantalla_carga= ""

##Señales Internas 
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()


func _on_BotonOpciones_pressed() -> void:
	$BotonSFX.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_ajustes)

func _get_configuration_warning() -> String:
	if menu_ajustes == "":
		return "chequear rutas"
	return ""

func _on_BotonNuevo_pressed() -> void:
	DatosJuego.nivel_actual = nivel_inial
# warning-ignore:return_value_discarded
	get_tree().change_scene(pantalla_carga)
