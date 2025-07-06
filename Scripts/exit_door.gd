extends Area2D

@export var color = 1
var count = 0
var player 
var exit = "blackExit"
func _ready():
	print("yes")
	if color == 1:
		exit = "blackExit"
		$AnimatedSprite2D.animation = "black"
	else:
		exit = "whiteExit"
		$AnimatedSprite2D.animation = "white"

func _on_body_entered(body):
	print("detected")
	if body.is_in_group("Player"):
		print("player detected")
		player = body
		get_tree().call_group("exit", "player_entered")

func _on_body_exited(body):
	if body.is_in_group("Player"):
		get_tree().call_group("exit", "player_exited")
		
func player_entered():
	print("player entered a door")
	count += 1
	if count > 1:
		player.queue_free()
		$AnimatedSprite2D.animation = exit
		$AnimatedSprite2D.play()
	
func player_exited():
	count -= 1


func _on_animated_sprite_2d_animation_finished() -> void:
	if color == 1:
		get_tree().change_scene_to_file(get_parent().level_next)
	pass # Replace with function body.
