extends Area2D

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	print("+1coin")
	queue_free()
