#GuradarCargar.gd
class_name GuardarCargartest
extends Node

##Guardar Datos 
#JSON
func guardar_datos_json(datos_a_guardar: Dictionary)->int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var archivo: File = File.new()
	
	var resultado: int = archivo.open(seleccionar_ruta(".json"), File.WRITE)
	
	if resultado == OK:
		archivo.store_line(to_json(datos_a_guardar))
		archivo.close()
	
	return resultado

##GDScript
func guardar_datos_tres(datos_a_guardar: Dictionary)->int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var datos: DatosUsuarioGaurdado = DatosUsuarioGaurdado.new()
	datos.nombre = datos_a_guardar.nombre
	
	var resultado: int = ResourceSaver.save(seleccionar_ruta(".tres"), datos)
	
	return resultado


func seleccionar_ruta(tipo_extension: String) -> String:
	var ruta: String
	
	if OS.is_debug_build():
		ruta = DatosConfiguracion.RUTA_GUARDADO_DEBUG
	else:
		ruta = DatosConfiguracion.RUTA_GUARDADO_RELEASE
	
	chequear_existencia_direcctorio(ruta)
	
	ruta += DatosConfiguracion.NOMBRE_ARCHIVO_DATOS + tipo_extension 
	
	return ruta

func chequear_existencia_direcctorio(ruta: String) -> void:
	var dir = Directory.new()
	if not dir.dir_exists(ruta):
# warning-ignore:return_value_discarded
		Directory.new().make_dir_recursive(ruta)

## Cargar Datos
## JSON
func cargar_datos_json() -> Dictionary:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return {}
	
	var archivo: File = File.new()
	var resultado: int = archivo.open(seleccionar_ruta(".json"), File.READ)
	if resultado == OK:
		var datos_cargados: Dictionary = parse_json(archivo.get_line())
		archivo.close()
		
		return datos_cargados
	
	return {}

## GDScript
func cargar_datos_tres() ->Dictionary:
	var datos: Resource = load(seleccionar_ruta(".tres"))
	
	return {"nombre": datos.nombre}

## Borrar datos 
## JSON
func borrar_datos_json() ->int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var dir = Directory.new()
	var resultado: int = dir.remove(seleccionar_ruta(".json"))
	
	return resultado

## GDScript
func borrar_datos_tres() ->int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var dir = Directory.new()
	var resultado: int = dir.remove(seleccionar_ruta(".tres"))
	
	return resultado
