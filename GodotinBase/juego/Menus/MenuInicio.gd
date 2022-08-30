tool
extends Control

export(String, FILE, "*.tscn") var menu_ajustes = ""




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
