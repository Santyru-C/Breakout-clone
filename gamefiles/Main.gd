extends Node

var ball_scene = load("res://scenes/ball.tscn")

func update_life_display():
	var format_text = "Lifes: %s"
	var player_lifes = $paddle.lifes
	$life_display.text = format_text % str(player_lifes)

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

func call_for_ball():
	var ball = ball_scene.instance()
	call_deferred("add_child", ball)
	
func _ready():
	call_for_ball()
	place_bricks()
	update_life_display()

func _on_paddle_life_depleted():
	pass # Replace with function body.

func _on_Area2D_body_exited(ball):
	ball.queue_free()
	call_for_ball()

func _on_paddle_life_down():
	update_life_display()
