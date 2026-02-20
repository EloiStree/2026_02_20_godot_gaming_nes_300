extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -200.0

#get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input direction: -1, 0, 1
	var direction := Input.get_axis("Move_Left", "Move_Right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0:
		animated_sprite.flip_h = true
		
	#Play Animations 
	if is_on_floor():
		if direction == 0: 
			animated_sprite.play("idle - Inactif")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
					
	# Apply movement 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
