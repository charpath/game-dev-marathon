extends Area2D

@export var color = 1
@export var id = 0
@export var self_state = 0

func _ready() -> void:
	if color == 1:
		$AnimatedSprite2D.animation = "black"
	else:
		$AnimatedSprite2D.animation = "white"

func change_state(state: int, channel: int):
	if channel == id:
		pass

func _on_body_entered(body):
	if body.is_in_group("Player") && self_state == 0:
		self_state = 1
		$AnimatedSprite2D.set_frame(1)
		get_tree().call_group("stateChange", "change_state", id, self_state)
		
