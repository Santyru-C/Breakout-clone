extends KinematicBody2D
export(int) var speed = 400
signal life_depleted

var lifes = 3
var direction = Vector2()
var velocity = Vector2()

func life_check():
	if lifes == 0:
		emit_signal("life_depleted")
		
func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1

func _physics_process(_delta):
	get_input()
	velocity = (direction * speed)
	velocity = move_and_slide(velocity)
	
func _ready():
	pass # Replace with function body.


func _on_Area2D_ball_exited(_body):
	lifes -= 1
	life_check()
