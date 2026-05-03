extends Node2D
var paused = false
@onready var menu = $"Pause Menu"
@onready var camera = $"Can Pause/Ball and Club/Ball/Camera2D2"

func _process(_delta: float) -> void:
	if is_instance_valid(camera):
		menu.global_position = camera.get_screen_center_position()
	Pause()
	Pause_Menu()
func Pause():
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		paused = !paused

func Pause_Menu():
	if paused:
		menu.show()
	
	else:
		menu.hide()
