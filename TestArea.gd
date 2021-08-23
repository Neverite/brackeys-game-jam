extends Spatial


var miner = preload("res://Character Scenes/Miner.tscn")
var ore = preload("res://Scenes/Ores.tscn")

func random_vector3(a : Vector3, b : Vector3):
	var result : Vector3
	result.x = rand_range(a.x, b.x)
	result.z = rand_range(a.z, b.z)
	result.y = -0.5
	
	return result

func _ready():
	for i in range(int(rand_range(12, 23))):
		var o = ore.instance()
		add_child(o)
		o.translation = random_vector3(Vector3(-89, 0, -89), Vector3(89, 0, 89))
		


func _on_Island_input_event(camera, event, click_position, click_normal, shape_idx):
	if Input.is_action_just_pressed("LMB"):
		var m = miner.instance()
		add_child(m)
		m.translation = click_position + Vector3(0, 0.8, 0)
		Resources.diamonds -= 2
	
