extends Area2D


signal on_levier_activated()



func set_levier_as_activated():
	on_levier_activated.emit()
	
	


func _on_body_entered(body: Node2D) -> void:
	set_levier_as_activated()
