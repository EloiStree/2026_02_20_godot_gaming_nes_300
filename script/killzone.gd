extends Area2D

@onready var timer = $Timer


	#print("Tu es mort.")
	#Engine.time_scale = 0.5
	#timer.start()

#STEP 1
func _on_body_entered(body: Node2D) -> void:
	if body:
		body.get_node("CollisionShape2D").queue_free()
	timer.start()
	Engine.time_scale = 0.5
	
	
#STEP 2	
func _on_timer_timeout():
	reload_scene()

#STEP 3
func reload_scene():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
