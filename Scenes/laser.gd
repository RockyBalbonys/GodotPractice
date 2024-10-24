extends Area2D

var laser_velocity = 800
var laser_damage = 20

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var direction = Vector2(cos(rotation), sin(rotation))
	position += direction * laser_velocity * delta
	var screen = get_viewport().get_visible_rect().size
	if position.x < 0 or position.x > screen.x or position.y < 0 or position.y > screen.y:
		queue_free()  # Remove the laser if it goes off the screen
		print("laser removed!")

func _on_Area2D_body_entered(body: Node) -> void:
	if body is RigidBody2D:  # Check if it's a RigidBody2D, like a meteor
		print("RigidBody2D entered the area!")
		body.take_damage(laser_damage)
		#body.apply_impulse(Vector2.ZERO, Vector2(0, -300))  # Example of pushing the meteor
		queue_free()  # You can also remove it if needed


	#if laser != null:
		#var mouse_pos = get_global_mouse_position()
		#var direction = Vector2(cos(laser.rotation), sin(laser.rotation))
		#laser.position += direction * laser_velocity * delta
		##print("laser on process func: ",laser)
