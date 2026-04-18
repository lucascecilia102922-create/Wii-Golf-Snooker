extends StaticBody2D
@onready var rot_pos = $"..".rotation_degrees
var SPEED = 5
@onready var max_pos = global_position.distance_to($"..".global_position)
@onready var current_pos = global_position.distance_to($"..".global_position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(max_pos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x = current_pos
	Hit_Move()
	Side_Move()
	
func Hit_Move():
	if Input.is_action_pressed("Up"):
		current_pos -= SPEED
		pass
	
	elif Input.is_action_pressed("Down"):
		current_pos += SPEED
		pass
	
	
	if Input.is_action_just_released("Up") or Input.is_action_just_released("Down"):
		Global.speed_pos = current_pos
		print(Global.speed_pos)
		
	current_pos = clamp(current_pos, 24 , max_pos)
	
func Side_Move():
	
	if Input.is_action_pressed("Left"):
		rot_pos -= 1

	elif Input.is_action_pressed("Right"):
		rot_pos += 1
		
		
		Input.is_action_just_released("Up")
	$"..".rotation_degrees = rot_pos
		
