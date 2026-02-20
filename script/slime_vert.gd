extends Node2D

const SPEED =100

var direction = 1

@onready var ray_cast_droite: RayCast2D = $RayCast_droite
@onready var ray_cast_gauche: RayCast2D = $RayCast_gauche
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_droite.is_colliding():
		direction =  -1
		animated_sprite.flip_h = true
	if ray_cast_gauche.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x +=direction * SPEED * delta
