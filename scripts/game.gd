extends Node2D

@export var max_asteroids := 10
@onready var lasers = $Lasers
@onready var player = $Player
@onready var asteroids = $Asteroids
@onready var hud = $UI/HUD
@onready var game_over_screen = $UI/GameOverScreen
@onready var player_spawn_pos = $PlayerSpawnPos
@onready var player_spawn_area = $PlayerSpawnPos/PlayerSpawnArea
@onready var high_score_label = $UI/GameOverScreen/CenterContainer/VBoxContainer/HighScore

const SAVE_PATH := "user://savegame.save"
var initialized := false
var asteroid_scene = preload("res://scenes/asteroid.tscn")
var high_score := 0
var score := 0:
	set(value):
		score = value
		hud.score = score
		if score > high_score:
			high_score = score
			save_high_score()
var lives: int:
	set(value):
		lives = value
		hud.init_lives(lives)

func init_spawn_position():
	update_spawn_position()
	player.global_position = player_spawn_pos.global_position
	initialized = true

func _ready():
	game_over_screen.visible = false
	score = 0
	lives = 3
	load_high_score()
	player.connect("laser_shot", _on_player_laser_shot)
	player.connect("died", _on_player_died)
	for asteroid in asteroids.get_children():
		asteroid.connect("exploded", _on_asteroid_exploded)
	var vp = get_viewport()
	if vp and not vp.size_changed.is_connected(update_spawn_position):
		vp.size_changed.connect(update_spawn_position)
	call_deferred("init_spawn_position")

func update_spawn_position():
	player_spawn_pos.global_position = get_viewport_rect().size / 2
	if not initialized:
		player.global_position = player_spawn_pos.global_position

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_player_laser_shot(laser):
	$LaserSound.play()
	lasers.add_child(laser)

func _on_asteroid_exploded(pos, size, points):
	$AsteroidHitSound.play()
	score += points
	for i in range(2):
		match size:
			Asteroid.AsteroidSize.LARGE:
				spawn_asteroid(pos, Asteroid.AsteroidSize.MEDIUM)
			Asteroid.AsteroidSize.MEDIUM:
				spawn_asteroid(pos, Asteroid.AsteroidSize.SMALL)
	var missing := max_asteroids - asteroids.get_child_count()
	for i in range(missing):
		await get_tree().create_timer(0.1).timeout
		spawn_random_asteroid()

func spawn_asteroid(pos, size):
	var a = asteroid_scene.instantiate()
	a.global_position = pos
	a.size = size
	a.connect("exploded", _on_asteroid_exploded)
	asteroids.call_deferred("add_child", a)
	
func spawn_random_asteroid():
	var a = asteroid_scene.instantiate()
	var screen_size = get_viewport_rect().size
	var edge = randi() % 4
	var pos := Vector2()
	match edge:
		0: pos = Vector2(randf_range(0, screen_size.x), -50)
		1: pos = Vector2(randf_range(0, screen_size.x), screen_size.y + 50)
		2: pos = Vector2(-50, randf_range(0, screen_size.y))
		3: pos = Vector2(screen_size.x + 50, randf_range(0, screen_size.y))
	a.global_position = pos
	a.size = Asteroid.AsteroidSize.LARGE
	a.connect("exploded", _on_asteroid_exploded)
	asteroids.add_child(a)
	
func maintain_asteroid_population():
	while asteroids.get_child_count() < max_asteroids:
		spawn_random_asteroid()

func _on_player_died():
	$PlayerDieSound.play()
	lives -= 1
	player.global_position = player_spawn_pos.global_position
	if lives <= 0:
		await get_tree().create_timer(2).timeout
		high_score_label.text = "HIGH SCORE: " + str(high_score)
		game_over_screen.visible = true
	else:
		await get_tree().create_timer(1).timeout
		while !player_spawn_area.is_empty:
			await get_tree().create_timer(0.1).timeout
		player.respawn(player_spawn_pos.global_position)
		
func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(high_score)

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			high_score = file.get_var()
