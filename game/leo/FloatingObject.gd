extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rgbd: RigidBody
export var lockZAxis = true

# Called when the node enters the scene tree for the first time.
func _ready():
	rgbd = get_node("RigidBody")
	rgbd.axis_lock_linear_z = lockZAxis;

	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
