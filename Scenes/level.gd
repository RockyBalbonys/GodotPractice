extends Node2D

var laser_scene: PackedScene = load("res://Scenes/laser.tscn")
var laser = null
#var laser_velocity = 400

func _ready() -> void:
	var width = get_viewport().get_visible_rect().size
	print(width)
	pass
	
func _process(delta: float) -> void:
	pass
	

func _on_laser_timer_timeout():
	var player = $Player
	laser = laser_scene.instantiate()
	print("laser!")
	$Lasers.add_child(laser)
	laser.position = player.position
	laser.rotation = player.rotation
	return
