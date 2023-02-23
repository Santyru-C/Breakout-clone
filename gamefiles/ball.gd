extends KinematicBody2D

export (int) var speed = 100

var rng = RandomNumberGenerator.new()
var rotation_list = [PI/4, -PI/4, 3*PI/4, -3*PI/4]
var direction = Vector2(1, 0)
var velocity = Vector2()

func _ready():
	rng.randomize()
	var initial_rotation = rotation_list[rng.randi_range(0,3)]
	var offset = rng.randf_range(-PI/8, PI/8)
	direction = direction.rotated(initial_rotation + offset)
	print(direction)
	
func _physics_process(delta):
	velocity = direction * speed
	var collides = move_and_collide(velocity * delta)
	
	if collides:
		direction = direction.bounce(collides.normal)
		speed += 25


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
