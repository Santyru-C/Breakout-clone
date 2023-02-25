extends Node

var ball_scene = load("res://scenes/ball.tscn")
var ball = ball_scene.instance()

func place_bricks():
	var position_y = 25
	for m in 8:
		var position_x = 62
		for n in 10:
			var brick_scene = load("res://scenes/brick.tscn")
			var brick = brick_scene.instance()
			
			if n != 0:
				position_x += 100
				
			brick.set_position(Vector2(position_x, position_y))
			add_child(brick)
			
		position_y += 23
	
func _ready():
	add_child(ball)
	place_bricks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
