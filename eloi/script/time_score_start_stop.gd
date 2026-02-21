extends Node

@export var label_to_affect: Label
@export var started: bool = false
@export var finished: bool = false

var time_start: float = 0.0
var time_elapsed: float = 0.0


func _ready():
	if label_to_affect:
		label_to_affect.text = "Ready ?"

func stop_timer():
	finished=true
	
	

func _process(delta):
	if not started:
		if Input.is_action_pressed("Aller_a_gauche") \
		or Input.is_action_pressed("Aller_a_droite"):
			started = true
			time_start = Time.get_unix_time_from_system() # Start NOW
			
		else:
			return
			
	if not finished:
		time_elapsed = Time.get_unix_time_from_system() - time_start
		if label_to_affect:
			label_to_affect.text = "%.2f" % time_elapsed
	
