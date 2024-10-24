extends CharacterBody2D
var speed = 500
var laser_speed = 1000
var player_health = 100
var label_hp: Label


func _ready() -> void:
	label_hp = get_node("../Control/Label")
	update_hp()


func update_hp() -> void:
	print(player_health)
	label_hp.text = "HP : " + str(player_health)

func take_damage(amount) -> void:
	player_health -= amount
	update_hp()

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	var mouse_pos = get_global_mouse_position()
	var look_at_mouse_pos = mouse_pos - global_position
	
	
	rotation = look_at_mouse_pos.angle()
	velocity = direction * speed
	
	move_and_slide()


func _on_timer_timeout() -> void:

	print("Fire!")
	pass # Replace with function body.
	
