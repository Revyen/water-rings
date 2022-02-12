extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bodysInside = []
export var direction = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	for body in bodysInside:
		if direction == "right":
			body.apply_central_impulse(Vector3.RIGHT * delta)
		if direction == "left":
			body.apply_central_impulse(Vector3.LEFT * delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	bodysInside.append(body)



func _on_Area_body_exited(body):
	bodysInside.erase(body)
