extends KinematicBody

var speed = rand_range(30, 50)
var explosion = preload("res://Actors/Explosion.tscn")
onready var scene = get_tree().current_scene

func _physics_process(delta):
	move_and_slide(Vector3(0, 0, speed))
	if transform.origin.z > 10:
		queue_free()


func _on_Area_body_entered(body):
	if "Bullet" in body.name:
		var expl_inst = explosion.instance()
		expl_inst.transform = transform
		scene.add_child(expl_inst)
		scene.score += 100
		queue_free()
