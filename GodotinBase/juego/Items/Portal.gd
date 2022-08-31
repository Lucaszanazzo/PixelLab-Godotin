class_name PortalNivel
extends Area

export(String, FILE, "*.tscn") var proximo_nivel = ""




func _on_Portal_body_entered(_body: Node) -> void:
	if proximo_nivel != "":
# warning-ignore:return_value_discarded
		get_tree().change_scene(proximo_nivel)
