extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play("Hit")
	await self.animation_finished
	self.queue_free()
