class_name MathFormularActor extends Node2D



@export var fall_speed:float = 40

@export var destroy_size_factor:float = 2
@export var failed_color:Color = Color.RED
@export var correct_color:Color = Color.GREEN

@export var particles : CPUParticles2D
@export var formular_holder : Control

var locked :bool = false 

signal calculation_finished(result:bool) 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + fall_speed*delta


func _destroy_after_vfx(result:bool)->void:
	locked = true
	particles.emitting = true
	formular_holder.visible = false
	await particles.finished
	calculation_finished.emit(result)
	queue_free()


func calculation_failed()->void:
	particles.color = failed_color
	_destroy_after_vfx(false)



func calculation_corrrect()->void:
	particles.color = correct_color
	_destroy_after_vfx(true)

func check_formular(answer: int)->bool:
	if locked:
		return false
	if answer == 3:
		calculation_corrrect()
		return true
	return false

func _on_target_area_emtered(_area:Area2D) -> void:
	calculation_failed()
