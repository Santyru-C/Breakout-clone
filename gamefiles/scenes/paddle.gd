extends KinematicBody2D
export(int) var speed = 400

var direction = Vector2()
var velocity = Vector2()

func get_input ():
	direction.x = 0
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
		print(1)
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
		print(-1)

func _physics_process(_delta):
	get_input()
	velocity = (direction * speed)
	velocity = move_and_slide(velocity)
	
func _ready():
	pass # Replace with function body.
