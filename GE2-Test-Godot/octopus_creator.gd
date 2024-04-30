extends Node3D
@export var num_tentacles:int=8
@export var tentacle_scene:PackedScene
var radius = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		var initial_rotate_amount = 360 / num_tentacles
		var rotate_amount = initial_rotate_amount
		var initial_pos = Vector3(0,0,0)
		for i in num_tentacles:
			var tentacle:Node3D
			tentacle = tentacle_scene.instantiate()
			tentacle.position = initial_pos
			print(rotate_amount)
			print(deg_to_rad(rotate_amount))
			tentacle.rotation = Vector3(0,deg_to_rad(rotate_amount),0)
			rotate_amount = rotate_amount + initial_rotate_amount

			add_child(tentacle)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
