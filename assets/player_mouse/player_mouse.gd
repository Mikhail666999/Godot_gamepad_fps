extends KinematicBody


var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

var Mouse_sensitivity = 0.3
var Speed = 150
var Jump = 150
var Gravity = 10

onready var head = $head

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * Mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * Mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	direction = Vector3()
	move_and_slide(fall, Vector3.UP)
	
	if not is_on_floor():
		fall.y -= Gravity
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = Jump

	if Input.is_action_pressed("move_up"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_down"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
		
#	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * Speed, 10 * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 
