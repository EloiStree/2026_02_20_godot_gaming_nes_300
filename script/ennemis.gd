extends Node2D

const SPEED = 60

var direction = 1
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastRight
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
