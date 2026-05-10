extends Control

@onready var score = $Score:
	set(value):
		score.text = "SCORE: " + str(value)
@onready var pause_label = $Pause
@onready var lives = $Lives

var uilife_scene = preload("res://scenes/ui_life.tscn")
var paused := false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause_label.visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		paused = !paused
		get_tree().paused = paused
		pause_label.visible = paused
	if event.is_action_pressed("reset"):
		get_tree().paused = false
		get_tree().reload_current_scene()
	if event.is_action_pressed("quit"):
		get_tree().quit()

func init_lives(amount):
	for ul in lives.get_children():
		ul.queue_free()
	for i in amount:
		var ul = uilife_scene.instantiate()
		lives.add_child(ul)
