extends Area2D

@export var speed := 500.0
@export var lifetime := 1.4

var movement_vector := Vector2(0, -1)
var time_alive := 0.0

func _physics_process(delta):
	global_position += movement_vector.rotated(rotation) * speed * delta
	var screen_size = get_viewport().get_visible_rect().size
	var margin := 2.0
	if global_position.x < -margin:
		global_position.x = screen_size.x + margin
	elif global_position.x > screen_size.x + margin:
		global_position.x = -margin
	if global_position.y < -margin:
		global_position.y = screen_size.y + margin
	elif global_position.y > screen_size.y + margin:
		global_position.y = -margin
	time_alive += delta
	if time_alive >= lifetime:
		queue_free()

func _on_area_entered(area):
	if area is Asteroid:
		area.explode()
		queue_free()
