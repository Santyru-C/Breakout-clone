extends KinematicBody2D
signal ball_collided(body)
export (int) var speed = 400

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
		if  $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play()
		direction = direction.bounce(collides.normal)
		emit_signal("ball_collided", collides.collider)
		if "brick" in collides.collider.get_name():
			collides.collider.queue_free()
