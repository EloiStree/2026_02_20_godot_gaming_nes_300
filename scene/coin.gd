class_name InGameCoin
extends Area2D

static var count: int = 0
static var in_game: Array[InGameCoin] = []

var consumed :=false
static func _cleanup_nulls() -> void:
	# Remove freed / invalid references
	in_game = in_game.filter(func(c): return c!=null)


func _ready() -> void:
	in_game.append(self)
	_cleanup_nulls()
	count=0


func _on_body_entered(body: Node2D) -> void:
	if consumed: 
		return
	print("+1 Point!")
	count += 1
	consumed=true

	# Remove this coin from the list before freeing it
	queue_free()
