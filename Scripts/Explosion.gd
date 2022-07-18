extends CPUParticles

const LIFE_TIME = 5
var cooldown = LIFE_TIME

func _ready():
	lifetime = LIFE_TIME

func _physics_process(delta):
	cooldown -= delta
	if cooldown <= 0:
		queue_free()
