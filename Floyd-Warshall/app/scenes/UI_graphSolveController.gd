extends Control

var statePanel : int = 0 ## 0: panel out # 1: panel in
var resultScr

func _ready():
	$Panel/result_screen.set_readonly(true)
	pass # Replace with function body.


func _on_add_node_button_up():
	$World._on_add_button_released()
	pass # Replace with function body.


func _on_init_matrix_button_up():
	var init_result = $World._on_initMatrix_released()
	$Panel/result_screen.set_text(($Panel/result_screen.get_text() + "\n" +init_result).c_unescape())
	pass # Replace with function body.


func _on_solve_by_step_button_up():
	$World._on_step_buttom_released()
	pass # Replace with function body.


func _on_solve_full_button_up():
	var solve_result = $World._on_solve_released()
	$Panel/result_screen.set_text(($Panel/result_screen.get_text() + "\n" +solve_result).c_unescape())
	pass # Replace with function body.


func _on_clear_button_up():
	$World._clear_graph()
	pass # Replace with function body.


func _on_panel_Slide_button_up():
	if statePanel == 0:
		$Animated_PanelSlide.play("slide_in")
		statePanel = 1
	else:
		$Animated_PanelSlide.play_backwards("slide_in")
		statePanel = 0
	pass # Replace with function body.
