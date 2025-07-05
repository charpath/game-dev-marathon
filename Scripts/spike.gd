extends Area2D

@export var color = 0

func _on_body_entered(body: Node2D):
	if color == 0 or body.player == color:
		get_tree().call_group("Player", "die")
