extends Area2D

@export var color = 1

func _on_body_entered(body: Node2D):
	if body.player == color:
		body.die()
