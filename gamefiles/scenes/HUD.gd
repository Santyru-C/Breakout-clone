extends CanvasLayer
signal start_game

func _ready():
	$main_display.text = "Breakout!"

func toggle_start_button():
	if $start_button.is_visible_in_tree(): #There's no ternary operator in GDScript
		$start_button.hide()
	else:
		$start_button.show()

func toggle_main_display():
	if $main_display.is_visible_in_tree():
		$main_display.hide()
	else:
		$main_display.show()
		
func _on_start_button_pressed():
	emit_signal("start_game")
