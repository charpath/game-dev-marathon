extends CharacterBody2D

@export var speed = 300
@export var gravity = 40
@export var jump_force = 700
@export var grav_max = jump_force
@export var player = 1
@export var coyote_frames = 5
@export var max_lockout = 20
var can_jump = true
var cur_coyote = coyote_frames
var on_ground = true
var initial_pos = Vector2.ZERO
var lockout = 0

func _physics_process(delta):
	if lockout > 0:
		lockout -= 1
		return
	
	if !is_on_floor():
		on_ground = false
		velocity.y += gravity
		if velocity.y > grav_max:
			velocity.y = grav_max
			
		if cur_coyote <= 0:
			can_jump = false
		else:
			cur_coyote -= 1
	
	if Input.is_action_pressed("jump_p{0}".format([player])) && can_jump:
		can_jump = false
		on_ground = false
		velocity.y = -jump_force
		
	if !on_ground and is_on_floor():
		cur_coyote = coyote_frames
		can_jump = true
		on_ground = true
	
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

func _ready():
	initial_pos = position
	
func die():
	position = initial_pos
	lockout = max_lockout
	velocity = Vector2.ZERO
