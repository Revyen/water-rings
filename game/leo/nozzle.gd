extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bodysInside = []
var bodyRotating = []
export var velocity = 10
export var rotationForce = 10
export var actionName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	bodysInside.clear()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if actionName == "":
		print("No Action Name defined for nozzle")
		pass
	if Input.is_action_pressed(actionName):
		for body in bodysInside:
			var aim = transform.basis.y + Vector3.UP
			body.apply_central_impulse(aim.normalized() * velocity * delta)
			if bodyRotating.find(body) == -1:
				var torque = Vector3(rand_range(-1,1),rand_range(-1,1),rand_range(-1,1))
				body.apply_torque_impulse(torque.normalized() * delta * rotationForce)
				bodyRotating.append(body)
	if Input.is_action_just_released(actionName):
		for body in bodysInside:
			bodyRotating.erase(body)
		


func _on_Area_body_entered(body: Node):
	bodysInside.append(body)
	


func _on_Area_body_exited(body):
	bodysInside.erase(body)
