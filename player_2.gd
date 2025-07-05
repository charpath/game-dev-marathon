extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 1000
var can_jump = true
@export var coyote_frames = 6
var cur_coyote = coyote_frames
var on_ground = true

func _physics_process(delta):
	if !is_on_floor():
		on_ground = false
		velocity.y += gravity
		if velocity.y > 600:
			velocity.y = 600
			
		if cur_coyote <= 0:
			can_jump = false
		else:
			cur_coyote -= 1
	
	if !on_ground and is_on_floor():
		cur_coyote = coyote_frames
		can_jump = true
		on_ground = true
		
	
	if Input.is_action_pressed("jump_p2") && can_jump:
		can_jump = false
		on_ground = false
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left_p2", "move_right_p2")
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
