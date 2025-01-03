class_name MathFormularActor extends Node2D

@export_category("formular")

@export var max_number:int = 20


@export var fall_speed:float = 40


@export_category("particles")
@export var failed_color:Color = Color.RED
@export var correct_color:Color = Color.GREEN

@export var particles : CPUParticles2D
@export var destroy_size_factor:float = 2


@export_category("soud")
@export var failed_sound:AudioStream
@export var correct_sound:AudioStream

@export var sound_player:AudioStreamPlayer2D

@export_category("general")

@export var formular_holder : Control

@export_range(1,100) var iterations : int = 5


var locked :bool = false 
var result:int = -1

signal calculation_finished(correct:bool,result:int) 
# Called when the node enters the scene tree for the first time.
var rng :RandomNumberGenerator= RandomNumberGenerator.new()

func _ready() -> void:

	var x1 = get_random_number(0, max_number)
	var x2 = get_random_number(0, max_number-x1)
	result = x1+x2
	
	var lbl := formular_holder.get_child(0) as Label
	lbl.text = "%d + %d =" % [x1,x2]
	pass # Replace with function body.


func get_random_number(from:int,to:int)->int:
	var num :int = 0
	for i in range(iterations):
		num += rng.randi_range(from, to)
	return num / iterations

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + fall_speed*delta


func _destroy_after_vfx(correct:bool)->void:
	locked = true
	particles.emitting = true
	formular_holder.visible = false
	await particles.finished
	calculation_finished.emit(correct,result)
	queue_free()


func calculation_failed()->void:
	particles.color = failed_color
	sound_player.stream = failed_sound 
	sound_player.play()
	_destroy_after_vfx(false)



func calculation_corrrect()->void:
	particles.color = correct_color
	sound_player.stream = correct_sound
	sound_player.play()
	_destroy_after_vfx(true)

func check_formular(answer: int)->void:
	if locked:
		return
	if answer == result:
		calculation_corrrect()

func _on_target_area_emtered(_area:Area2D) -> void:
	if locked:
		return
	calculation_failed()
