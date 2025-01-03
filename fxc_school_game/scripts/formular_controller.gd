class_name FormularControler extends Control

@export var formular_actor: PackedScene

var formular_actor_instance :MathFormularActor


signal spawned_new_actor()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_formular_actor()

func spawn_formular_actor()->void:
	formular_actor_instance = formular_actor.instantiate() as MathFormularActor
	if not formular_actor_instance:
		print("critical error spawning formular")

	add_child(formular_actor_instance)
	formular_actor_instance.global_position = global_position
	formular_actor_instance.calculation_finished.connect(on_formular_actor_destroyed)
	spawned_new_actor.emit()

func solve_formular(solution:int)-> void:
	formular_actor_instance.check_formular(solution)


func on_formular_actor_destroyed(_success:bool,_result:int)->void:
	spawn_formular_actor()

