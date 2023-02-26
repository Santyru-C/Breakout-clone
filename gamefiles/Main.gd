extends Node

var ball_scene = load("res://scenes/ball.tscn")
var score = 0
func update_life_display():
	var format_text = "Lifes: %s"
	var player_lifes = $paddle.lifes
	$HUD/life_display.text = format_text % str(player_lifes)
	
func place_bricks():
	var position_y = 25
	for row in 8:
		var position_x = 62
		for n in 10:
			var brick_scene = load("res://scenes/brick.tscn")
			var brick = brick_scene.instance()
			
			if n != 0:
				position_x += 100
				
			brick.set_position(Vector2(position_x, position_y))
			call_deferred("add_child", brick)
			
		position_y += 23

func call_for_ball():
	var ball = ball_scene.instance()
	if $paddle.lifes != 0:
		yield(get_tree().create_timer(0.25), "timeout")
		call_deferred("add_child", ball)

func reset_properties():
	$paddle.lifes = 3
	$paddle.speed = 400
	$HUD/score_display.text = "0"
	
func new_game():
	$HUD.toggle_start_button()
	$HUD.toggle_main_display()
	reset_properties()
	place_bricks()
	update_life_display()
	call_for_ball()

func game_over():
	$paddle.speed = 0
	get_tree().call_group("bricks", "queue_free")
	$HUD/main_display.text = "Game Over!"
	$HUD.toggle_start_button()
	$HUD.toggle_main_display()
	
func _ready():
	pass

func _on_paddle_life_depleted():
	game_over()
	
func _on_paddle_life_down():
	update_life_display()

func _on_Area2D_body_exited(ball):
	$paddle.lifes -= 1
	print($paddle.lifes)
	ball.queue_free()
	call_for_ball()

