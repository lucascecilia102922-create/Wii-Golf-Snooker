extends RigidBody2D
var strength = Global.speed_pos * 10
@onready var club = $Club
@onready var pre_club = preload("res://Prefabs/club.tscn")
@onready var animation = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Respawn()
	Anim()
	pass


func _on_body_entered(body: StaticBody2D) -> void:
	if body.is_in_group("Club"):
		var direction = (global_position - body.global_position).normalized()
		strength = Global.speed_pos * 10
		apply_impulse(direction * strength)
		print("Acerto do taco")
		print("Força da tacada: ",strength)
		$Club.queue_free()

func Respawn():
	if sleeping == true and not is_instance_valid(club):
		var spawned_club = pre_club.instantiate()
		add_child(spawned_club)
		club = spawned_club
		print("Parado e sem taco")

func Anim():
	if sleeping == false and not is_instance_valid(club):
		animation.play("Hit")
	else:
		animation.play("Idle")
	
