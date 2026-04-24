extends StaticBody2D
@onready var rot_pos = $"..".rotation_degrees
var SPEED = 5
@onready var max_pos :float = global_position.distance_to($"..".global_position)
@onready var current_pos :float = global_position.distance_to($"..".global_position)
var con_wiimotes = GDWiimoteServer.finalize_connection()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(max_pos)
	print(current_pos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = current_pos
	Hit_Move(delta)
	Side_Move()
	connection()
	
func Hit_Move(delta: float):
	if Global.connected:
		var wiimote = con_wiimotes[0]
		Global.wii_acc = wiimote.get_accel()
		print(Global.wii_acc)
		
		## Aplica aceleração como força
		#velocity += Global.wii_acc.x * ACCEL_FORCE * delta
		#
		## Aplica "atrito" pra não ficar infinito
		#velocity *= FRICTION
		#
		## Atualiza posição
		#current_pos += velocity * delta
		#
		# Limita
		
		var target_pos = (Global.wii_acc.x + 1.0) * 0.5 * max_pos
		current_pos = lerp(current_pos, target_pos, 0.3)
		current_pos = clamp(current_pos, 24, max_pos)
		
	#if Input.is_action_pressed("Up"):
		#current_pos -= SPEED
		#pass
	#
	#elif Input.is_action_pressed("Down"):
		#current_pos += SPEED
		#pass
	#
	
	if Input.is_action_just_released("Up") or Input.is_action_just_released("Down"):
		Global.speed_pos = current_pos
		print(Global.speed_pos)
	
func Side_Move():
	
	if Input.is_action_pressed("Left"):
		rot_pos -= 1

	elif Input.is_action_pressed("Right"):
		rot_pos += 1
		
		
		Input.is_action_just_released("Up")
	$"..".rotation_degrees = rot_pos
		
func connection():
	if Global.connected == true and Global.connecting == true:
		var wiimote = con_wiimotes[0]
		wiimote.set_motion_sensing(true)
		Global.connecting = false
