extends KinematicBody
onready var SLIDESCREEN = $"../Control/TextureButton"
onready var CAMERA = $head/Camera
onready var HEAD = $head
export var SENSITIVELY = 0.1
var speed = 8
var velocity = Vector3.ZERO
var move = Vector3.ZERO
func _ready():
	pass
	
func _physics_process(_delta):
	move = Vector3(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0,
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized().rotated(Vector3.UP, rotation.y)
	velocity.x = move.x * speed
	velocity.z = move.z * speed
	velocity = move_and_slide(velocity)
func _input(event):
	if event is InputEventMouseMotion and SLIDESCREEN. is_hovered():
		HEAD.rotate_x(deg2rad(-event.relative.y) * SENSITIVELY)
		rotate_y(deg2rad(-event.relative.x) * SENSITIVELY)
