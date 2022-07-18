extends KinematicBody

const SPEED = 600

func _physics_process(_delta):
	move_and_slide(transform.basis.z * -SPEED)
	if transform.origin.z < -1000 or abs(transform.origin.x) > 60:
		queue_free()
