class_name Moneda 
extends Area







func _on_MonedaDorada_body_entered(_body: Node) -> void:
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disable", true)
	$AnimationPlayer.play("Consumida")
