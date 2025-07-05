extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 1000
@export var grav_max = 600
@export var player = 1

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > grav_max:
			velocity.y = grav_max
	
	if Input.is_action_just_pressed("jump_p{0}".format([player])) && is_on_floor():
		velocity.y -= jump_force
	
	var horizontal_direction = Input.get_axis("move_left_p{0}".format([player]), "move_right_p{0}".format([player]))
	
	velocity.x = speed * horizontal_direction
	
	move_and_slide()
	
func _process(delta):

	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
