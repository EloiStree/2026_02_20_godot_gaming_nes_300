class_name CoinScoreCountToLabel extends Node


@export var label_to_affect:Label
@export var coin_at_ready:int=0

func _ready() -> void:
	
	await get_tree().create_timer(0.2) .timeout
	coin_at_ready =InGameCoin.in_game.size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if label_to_affect:
		label_to_affect.text = str(InGameCoin.count)+"/"+str(coin_at_ready)
	pass
