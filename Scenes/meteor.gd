extends RigidBody2D

var player: CharacterBody2D  # Reference to the player node
var follow_speed: float = 100.0  # Adjust speed as necessary
var meteor_health = 100
var meteor_damage = 50
var meteor_label_hp: Label

func _ready():
	player = get_parent().get_node("Player")
	meteor_label_hp = get_node("Control/Label")
	update_meteor_hp()

func update_meteor_hp():
	meteor_label_hp.text = str(meteor_health) + "%"
	if meteor_health <= 0:
		queue_free()

func take_damage(amount):
	meteor_health -= amount
	update_meteor_hp()

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		apply_central_force(direction * follow_speed)
	pass # Replace with function body.

func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.
