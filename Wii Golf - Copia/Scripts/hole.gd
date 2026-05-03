extends Area2D
@onready var ball_sprite = $"../../Ball and Club/Ball/Sprite Ball"
@onready var ball = $"../../Ball and Club/Ball"
@export var level : PackedScene

var Speed = 125

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(ball):
		if ball.winning:
			win_fall(delta)
	pass


func _on_area_entered(area) -> void:
	if area.is_in_group("Ball") and not ball.winning:
		print("Ganhou")
		ball.winning = true
		ball.linear_velocity = Vector2.ZERO
		ball.angular_velocity = 0
		
		

			
func win_fall(delta: float):
	var ballx = move_toward(ball_sprite.global_position.x, global_position.x, delta*Speed)
	var bally = move_toward(ball_sprite.global_position.y, global_position.y, delta*Speed)
	
	ball_sprite.global_position = Vector2(ballx,bally)
	
	ball_sprite.scale -= (Vector2(0.7, 0.7) * delta)
	
	if ball_sprite.scale.x <= 0.1:
		#var spawned_ball = pre_ball.instantiate()
		ball.queue_free()
		if is_instance_valid(level):
			get_tree().change_scene_to_packed(level)
		else:
			get_tree().reload_current_scene()
		#ball = spawned_ball
		#get_parent().add_child(ball)
		#ball_sprite = ball.get_node("AnimatedSprite2D")
		#ball.global_position = start_pos
		
		
		
