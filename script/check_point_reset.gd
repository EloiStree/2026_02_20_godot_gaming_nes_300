extends Node

@export var player: Node2D
@export var checkpoints: Array[Node2D]

@export var reset_player_if_under_y := 20.0


func reset_position_at_last_left_checkpoint():
	var closest_distance := INF
	var position_found := Vector2.ZERO
	
	for point in checkpoints:
		
		# Only consider checkpoints to the LEFT of player
 		if point.position.x <= player.position.x:
			
			var distance = player.position.x - point.position.x
			
			if distance < closest_distance:
				closest_distance = distance
				position_found = point.position
	
	# If we found a valid checkpoint, reset player
	if closest_distance != INF:
		player.position = position_found


func _process(delta: float) -> void:
	# If player falls below threshold
	if player.position.y < reset_player_if_under_y:
		reset_position_at_last_left_checkpoint()
