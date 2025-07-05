extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 1000

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 600:
			velocity.y = 600
	
	if Input.is_action_just_pressed("jump_p2") && is_on_floor():
		velocity.y -= jump_force
	
	var horizontal_direction = Input.get_axis("move_left_p2", "move_right_p2")
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
