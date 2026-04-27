extends RigidBody2D
var strength = Global.speed_pos * 10
@onready var club = $Club_Character
@onready var arrow = $"Sprite Arrow"
@onready var pre_arrow = preload("res://Prefabs/sprite_arrow.tscn")
@onready var pre_club = preload("res://Prefabs/club_character.tscn")
@onready var pre_smoke = preload("res://Prefabs/hit_smoke.tscn")
@onready var animation = $"Sprite Ball"
var winning = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Respawn()
	Anim()


func _on_body_entered(body) -> void:
	if body.is_in_group("Club"):
		#var direction = (global_position - body.global_position).normalized()
		#strength = Global.speed_pos * 10
		#apply_impulse(direction * strength)
		#print("Acerto do taco")
		#print("Força da tacada: ",strength)
		club.queue_free()
		arrow.queue_free()
		hit_anim()

func Respawn():
	if sleeping == true and not is_instance_valid(club) and winning == false:
		var spawned_club = pre_club.instantiate()
		var spawned_arrow = pre_arrow.instantiate()
		Global.speed_pos = 160
		print("Parado e sem taco")
		add_child(spawned_club)
		add_child(spawned_arrow)
		club = spawned_club
		arrow = spawned_arrow

func Anim():
	if sleeping == false and not is_instance_valid(club):
		animation.play("Hit")
	else:
		animation.play("Idle")
		

func hit_anim():
	var smoke = pre_smoke.instantiate()
	get_tree().current_scene.add_child(smoke)
	smoke.global_position = self.global_position
		

		
		
	
