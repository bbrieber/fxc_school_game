extends Control


@export var formular_controller : FormularControler
@export var label :Label 

var current_result:int
var initialized:bool = false

func _ready() -> void:
	formular_controller.spawned_new_actor.connect(reset)
	reset()

func reset()->void:
	initialized = false
	label.text = ""

func create_result(num:int)->void:
	if not initialized:
		initialized = true
		current_result = num
	else:
		current_result = current_result* 10 + num
	label.text = str(current_result)
	

func remove_digit()->void:
	if initialized:
		current_result = current_result / 10 
		label.text = str(current_result)
	
func check_formular()->void:
	formular_controller.solve_formular(current_result)


func _unhandled_key_input(event: InputEvent) -> void:
	#key event.as_text()
	if event.is_action_pressed("fxc_0"):
		create_result(0)
	elif event.is_action_pressed("fxc_1"):
		create_result(1)
	elif event.is_action_pressed("fxc_2"):
		create_result(2)
	elif event.is_action_pressed("fxc_3"):
		create_result(3)
	elif event.is_action_pressed("fxc_4"):
		create_result(4)
	elif event.is_action_pressed("fxc_5"):
		create_result(5)
	elif event.is_action_pressed("fxc_6"):
		create_result(6)
	elif event.is_action_pressed("fxc_7"):
		create_result(7)
	elif event.is_action_pressed("fxc_8"):
		create_result(8)
	elif event.is_action_pressed("fxc_9"):
		create_result(9)
	elif event.is_action_pressed("fxc_erase"):
		remove_digit()
	check_formular()
	pass


func _on_number_pressed(num:int) -> void:
	create_result(num)
	check_formular()


