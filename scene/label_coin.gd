extends Label

@export var label_to_changed : Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	label_to_changed.text = str(Coin.coin)
