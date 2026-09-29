extends Area2D

func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "play_1":
		print("Player1 Ganhou!")
	elif body.name == "player_2":
		print("Player2 Ganhou!")
