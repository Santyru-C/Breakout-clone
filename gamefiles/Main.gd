extends Node

var ball_scene = load("res://scenes/ball.tscn")
var ball = ball_scene.instance()

func _ready():
	add_child(ball)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
