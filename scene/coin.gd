class_name Coin extends Area2D
 

static var coin :int= 0


func _ready() -> void:
	coin =0

func _on_body_entered(body: Node2D) -> void:
	print("+1 coin")
	coin+=1
	queue_free()
	pass # Replace with function body.
