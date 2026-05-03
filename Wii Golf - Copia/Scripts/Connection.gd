extends Node2D
var loading
var connection_thread: Thread

func _ready():
	# GDWiimoteServer.connect_wiimotes is blocking!
	# loading = get_tree().get_current_scene().get_node("Can Pause/Loading")
	connection_thread = Thread.new()
	connection_thread.start(_connect_wiimotes_thread)

func _connect_wiimotes_thread():
	# Initialize loading screen
	#call_deferred("_start_loading")
	print("Conectando Wii Remote...")
	# ...

	GDWiimoteServer.initialize_connection(true)
	call_deferred("_on_connection_complete")

func _on_connection_complete():
	# Hide loading screen
	#loading.hide()
	# ...
	
	# Retrieve connected Wiimotes
	var connected_wiimotes = GDWiimoteServer.finalize_connection()
	Global.connected = true
	Global.wiimotes	= connected_wiimotes[0]
	print(Global.wiimotes)
	## can also retrieve later on with GDWiimoteServer.get_connected_wiimotes()

func _start_loading():
	loading.show() #Comentar aqui para tirar a tela de loading
	pass
	#
#func _exit_tree() -> void:
	#if connection_thread and connection_thread.is_started():
		#connection_thread.wait_to_finish()
