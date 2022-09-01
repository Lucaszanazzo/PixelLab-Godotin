#GuardarCargarTest.gd
extends Node



func _on_BotonGuardar_pressed() -> void:
	if $NombrejSON.text != "":
		var guardar: GuardarCargartest= GuardarCargartest.new()
		var resultado: int = guardar.guardar_datos_json(
			{
				"nombre": $NombrejSON.text
			}
		)
		$TextoResultadojSON.text = "%s" % resultado
	else:
		$TextoResultadojSON.text = "El campo no puede estar vacio"


func _on_BotonCargar_pressed() -> void:
	var cargar: GuardarCargartest = GuardarCargartest.new()
	var datos: Dictionary = cargar.cargar_datos_json()
	if not datos.empty():
		$NombrejSON.text = datos.nombre
		$TextoResultadojSON.text = "Carga Exitosa"
	else: 
		$TextoResultadojSON.text = "Error en la carga"


func _on_BotonGuardarGodot_pressed() -> void:
	if $NombreTRES.text != "":
		var guardar: GuardarCargartest = GuardarCargartest.new()
		var resultado: int = guardar.guardar_datos_tres(
			{
				"nombre": $NombreTRES.text
			}
		)
		$TextoResultadoTRES.text = "%s" % resultado
	else:
		$TextoResultadoTRES.text = "El campo no puede estar vacio"


func _on_BotonCargarGodot_pressed() -> void:
	var cargar: GuardarCargartest =GuardarCargartest.new()
	var datos: Dictionary = cargar.cargar_datos_tres()
	if not datos.empty():
		$NombreTRES.text = datos.nombre
		$TextoResultadoTRES.text = "Carga Exitosa"
	else: 
		$TextoResultadoTRES.text = "Error en la carga"


func _on_BotonEliminarGodot_pressed() -> void:
	var borrar: GuardarCargartest = GuardarCargartest.new()
	var resultado: int  = borrar.borrar_datos_tres()
	$TextoResultadoTRES.text = "%s" % resultado

##Json
func _on_BotonEliminar_pressed() -> void:
	var borrar: GuardarCargartest = GuardarCargartest.new()
	var resultado: int  = borrar.borrar_datos_json()
	$TextoResultadojSON.text = "%s" % resultado
