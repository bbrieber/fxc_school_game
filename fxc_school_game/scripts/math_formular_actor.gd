extends Node2D



@export var fall_speed:float = 40

@export var destroy_size_factor:float = 2
@export var failed_color:Color = Color.RED
@export var correct_color:Color = Color.GREEN



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + fall_speed*delta


func calculation_failed()->void:
	pass


func calculation_corrrect()->void:
	pass

func check_formular(answer: int)->bool:
	return true