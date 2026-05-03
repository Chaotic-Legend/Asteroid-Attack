extends Area2D

@onready var collect_sound: AudioStreamPlayer2D = $CollectSound

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("asteroids"):
		print("Asteroid Collected!")
		body.queue_free()
		collect_sound.play()
	else:
		print("Not an asteroid, ignoring")
	
