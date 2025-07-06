extends Area2D

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
		pass

func _on_body_entered(body):
	if body.is_in_group("Player") && self_state == 0:
		self_state = 1
		$AnimatedSprite2D.set_frame(1)
		get_tree().call_group("stateChange", "change_state", self_state, id)
		
