extends CharacterBody2D
@onready var rot_pos = $"..".rotation_degrees
@onready var max_pos :float = global_position.distance_to($"..".global_position)
@onready var current_pos :float = global_position.distance_to($"..".global_position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = current_pos
	Hit_Move(delta)
	Side_Move(delta)
	connection()
	
func Hit_Move(delta: float):
	if Global.connected:
		Global.wiimotes.set_rumble(false)
		
		Global.wii_acc = Global.wiimotes.get_accel()
		
		#Mudança de posição com base no acc:
		var target_pos = (Global.wii_acc.x + 1.5) * 0.5 * max_pos
		current_pos = lerp(current_pos, target_pos, 30 * delta)
		current_pos = clamp(current_pos, 20, max_pos)
		
	if Input.is_action_pressed("Up"):
		current_pos -= 600 * delta
		pass
	
	elif Input.is_action_pressed("Down"):
		current_pos += 600 * delta
		pass
	
	
	if Input.is_action_just_released("Up") or Input.is_action_just_released("Down"):
		Global.speed_pos = current_pos
		print(Global.speed_pos)
	
func Side_Move(delta):
	
	if Input.is_action_pressed("Left"):
		rot_pos -= 250 * delta

	elif Input.is_action_pressed("Right"):
		rot_pos += 250 * delta
		
		
		#Input.is_action_just_released("Up")
	$"..".rotation_degrees = rot_pos
		
func connection():
	if Global.connected == true and Global.connecting == true:
		Global.wiimotes.set_motion_sensing(true)
		Global.connecting = false
