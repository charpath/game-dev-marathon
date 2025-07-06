extends StaticBody2D

@export var color = 1
@export var id = "AQUA"
@export var self_state = 0

func _ready() -> void:
	$MeshInstance2D.set_modulate(id)
	if color == 1:
		$AnimatedSprite2D.animation = "black"
	else:
		$AnimatedSprite2D.animation = "white"

func change_state(state: int, channel):
	if channel == id:
		set_state(state)
		
func set_state(state):
	if self_state == state:
		pass
	elif state == 1:
		self_state = state
		$AnimatedSprite2D.set_frame(1)
		$MeshInstance2D.set_visible(false)
		$AnimatedSprite2D.play()
	elif state == 0:
		self_state = state
		$CollisionShape2D.set_disabled(false)
		$AnimatedSprite2D.play_backwards()
		
func _frame_changed() -> void:
	if $AnimatedSprite2D.get_frame() == 1 && self_state == 0:
		$MeshInstance2D.set_visible(true)
	elif $AnimatedSprite2D.get_frame() == 5 && self_state == 1:
		$CollisionShape2D.set_disabled(true)
