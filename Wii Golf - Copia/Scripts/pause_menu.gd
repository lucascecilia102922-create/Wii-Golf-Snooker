extends Control
@onready var camera = $"../Can Pause/Ball and Club/Ball/Camera2D2"
@onready var focus_button = $PanelContainer/VBoxContainer/Resume

func _ready() -> void:
	hide()
	
func _process(_delta: float) -> void:
	if is_instance_valid(camera):
		self.global_position = camera.get_screen_center_position()
	pause()
	pass
	
func Resume():
	hide()
	get_tree().paused = false

func _on_resume_pressed() -> void:
	Resume()

func _on_restart_pressed() -> void:
	Resume()
	get_tree().reload_current_scene()

func _on_quit_to_windows_pressed() -> void:
	get_tree().quit()
	
func pause():
	if Input.is_action_just_pressed("Pause") and get_tree().paused == true:
		hide()
		get_tree().paused = false
		print(get_tree().paused)
		
	
	elif Input.is_action_just_pressed("Pause") and get_tree().paused == false:
		get_tree().paused = true
		show()
		focus_button.grab_focus()
		print(get_tree().paused)
