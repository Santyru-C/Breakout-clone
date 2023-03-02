extends CanvasLayer
signal start_game

func _ready():
	$main_display.text = "Breakout!"
	$score_display.hide()
	$life_display.hide()
	
func toggle(node):
	if node.is_visible_in_tree():  #There's no ternary operator in GDScript
		node.hide()
	else:
		node.show()
		
func _on_start_button_pressed():
	emit_signal("start_game")
