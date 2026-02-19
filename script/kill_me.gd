extends Node

@export var who_to_kill:Node


func kill_it():
	print("Test kill it")
	if who_to_kill != null:
		who_to_kill.queue_free()
