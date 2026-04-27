extends StaticBody2D
@onready var anim = $AnimatedSprite2D
@onready var ball = $"../../Ball and Club/Ball"
const max_speed = 3000
const speed = 1500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Ball"):
		var direction = (ball.global_position - global_position).normalized()
		ball.apply_central_impulse(direction * speed)
		
		if ball.linear_velocity.length() > max_speed:
			ball.linear_velocity = ball.linear_velocity.normalized() * max_speed
		
		print("Hit da Bola!")
		anim.play("Hit")
		
	pass # Replace with function body.
