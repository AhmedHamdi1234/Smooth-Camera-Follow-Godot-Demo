extends RigidBody

export var moveForce: float
export var jumpForce: float
var rigidbody: RigidBody
var movePos: Vector3;
var jump: Vector3;
var ground_raycast: RayCast





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ground_raycast = self.get_node("RayCast")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(Input.get_action_strength("ui_left")):
		movePos = Vector3(-moveForce * delta, 0, 0)
		self.add_force(movePos, transform.origin)
	if(Input.get_action_strength("ui_right")):
		movePos = Vector3(moveForce * delta, 0, 0)
		self.add_force(movePos, transform.origin)
	
	
	if(ground_raycast.enabled && ground_raycast.get_collider()):
		if(Input.get_action_strength("ui_accept")):
			jump = Vector3(0, jumpForce * delta, 0)
			self.apply_impulse(transform.origin, jump)
			



