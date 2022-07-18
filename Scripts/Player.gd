extends KinematicBody

const MAX_SPEED = 30
const ACCELERATION = 0.75
const FIRE_DELAY = 10

var bullet = preload("res://Actors/Bullet.tscn")
onready var scene = get_tree().current_scene
onready var guns = [$Gun, $Gun2]

var input_vector = Vector3.ZERO
var velocity = Vector3.ZERO
var cooldown = 0

func fire(delta):
	cooldown = FIRE_DELAY * delta
	for g in guns:
		var bullet_instance = bullet.instance()
		bullet_instance.global_transform = g.global_transform
		scene.add_child(bullet_instance)

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y =  Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	velocity.x = move_toward(velocity.x, input_vector.x * MAX_SPEED, ACCELERATION)
	velocity.y = move_toward(velocity.y, input_vector.y * MAX_SPEED, ACCELERATION)
	
	rotation_degrees.z = velocity.x * -2
	rotation_degrees.x = velocity.y * 2
	rotation_degrees.y = -velocity.x * 2
	
	move_and_slide(velocity)
	
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
	if Input.is_action_pressed("ui_accept") and cooldown <= 0:
		fire(delta)
	
	if cooldown > 0:
		cooldown -= delta
	

func _on_DetectArea_body_entered(body):
	if "Enemy" in body.name:
		get_tree().reload_current_scene()
