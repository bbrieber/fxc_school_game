extends TextureButton

@export var num:int=0
signal number_pressed(num:int)

func _ready() -> void:
	button_down.connect(_on_button_down)
	pass # Replace with function body.


func _on_button_down() -> void:
	number_pressed.emit(num)
