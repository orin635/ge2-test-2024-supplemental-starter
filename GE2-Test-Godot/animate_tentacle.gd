extends Node3D
@export var tentacle_length:int=5
var newMaterial = StandardMaterial3D.new()
var red = 0
var green = 0
var blue = 0
var max_color = 255
var rand_dir = randf_range(-1, 1)

@export var max_extension = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if(rand_dir >= 0):
		rand_dir = 1
	elif(rand_dir < 0):
		rand_dir = -1
	print(rand_dir)
	var change_color = 0
	var tentacle_pos = 1.1
	for i in tentacle_length:
		var part = CSGBox3D.new()
		part.position = Vector3(tentacle_pos * i, 0,0)
		part.size = Vector3(1,0.1,1)
		newMaterial.albedo_color = Color.from_hsv(randf_range(0, 1), 1, 1, 0.8)
		part.material = newMaterial
		add_child(part)




var change_color = 0
var last_pos_y = 0.00
var increment_amount = 0.001 * rand_dir

func _process(delta):
	var all_parts = get_children()
	change_color = change_color + 1
	if(change_color == 15):
		newMaterial.albedo_color = Color.from_hsv(randf_range(0, 1), 1, 1, 0.8)
		for part in all_parts:
			if part == CSGBox3D:
				part.material = newMaterial
		change_color = 0
	
	var part_num = 0
	var last_part_pos = Vector3(0,0,0)
	for part in all_parts:
		if part.is_class("CSGBox3D"):
			var current_pos = part.position
			var y_increase = increment_amount * part_num * part_num
			current_pos.y = current_pos.y + y_increase
			part.transform.origin = current_pos
			part_num = part_num + 1
			
			part.rotation = Vector3(0,0,part.position.y/(tentacle_length/2.2))
			
			last_part_pos = current_pos
			if(current_pos.y > max_extension or current_pos.y < -max_extension):
				increment_amount = increment_amount * -1
			
	
	
	
