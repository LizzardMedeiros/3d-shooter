extends Position3D

onready var scene = get_tree().current_scene
var enemy = preload("res://Actors/Enemy.tscn")

func spawn():
	var enemy_instance = enemy.instance()
	var xx = rand_range(-15, 15)
	var yy = rand_range(-10, 10)
	enemy_instance.transform.origin = transform.origin + Vector3(xx, yy, 0)
	scene.add_child(enemy_instance)
	
func _on_Timer_timeout():
	spawn()
