extends Control

var current_result:int
var initialized:bool = false


func reset()->void:
	initialized = false

func check_formular(num:int)->void:
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	#key event.as_text()
	if event.is_action_pressed("fxc_0"):
		check_formular(0)
	elif event.is_action_pressed("fxc_1"):
		check_formular(1)
	elif event.is_action_pressed("fxc_2"):
		check_formular(2)
	elif event.is_action_pressed("fxc_3"):
		check_formular(3)
	elif event.is_action_pressed("fxc_4"):
		check_formular(4)
	elif event.is_action_pressed("fxc_5"):
		check_formular(5)
	elif event.is_action_pressed("fxc_6"):
		check_formular(6)
	elif event.is_action_pressed("fxc_7"):
		check_formular(7)
	elif event.is_action_pressed("fxc_8"):
		check_formular(8)
	elif event.is_action_pressed("fxc_9"):
		check_formular(9)
	elif event.is_action_pressed("fxc_"):
		check_formular(0)
	pass
