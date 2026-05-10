class_name Player extends CharacterBody2D

signal laser_shot(laser)
signal died

@export var acceleration := 10.0
@export var max_speed := 350.0
@export var rotation_speed := 250.0
@onready var muzzle = $Muzzle
@onready var sprite = $Sprite2D
@onready var cshape = $CollisionShape2D
var laser_scene = preload("res://scenes/laser.tscn")
var shoot_cd = false
var last_shot_time := 0.0
var fire_delay := 0.35
var alive := true

func _process(_delta):
	if !alive:
		return
	if Input.is_action_pressed("shoot"):
		var now = Time.get_ticks_msec() / 1000.0
		if now - last_shot_time >= fire_delay:
			last_shot_time = now
			shoot_laser()

func _physics_process(delta):
	if !alive: return
	var input_vector := Vector2(0, Input.get_axis("move_forward", "move_backward"))
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*delta))
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	move_and_slide()
	var screen_size = get_viewport_rect().size
	if global_position.y < 0:
		global_position.y = screen_size.y
	elif global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	elif global_position.x > screen_size.x:
		global_position.x = 0

func shoot_laser():
	var l = laser_scene.instantiate()
	l.global_position = muzzle.global_position
	l.rotation = rotation
	emit_signal("laser_shot", l)

func die():
	if alive==true:
		alive = false
		sprite.visible = false
		cshape.set_deferred("disabled", true)
		emit_signal("died")
		
func respawn(pos):
	if alive == false:
		alive = true
		global_position = pos
		velocity = Vector2.ZERO
		rotation = 0
		sprite.visible = true
		cshape.set_deferred("disabled", false)
