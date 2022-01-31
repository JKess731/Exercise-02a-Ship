extends KinematicBody2D

var velocity = Vector2.ZERO
var rotation_speed = 5.0
var speed = 0.1
var maxSpeed = 10.0

func _ready():
	pass 

func _physics_process(_delta):
	position += velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, maxSpeed)
	
	$Exhaust.hide()
	if Input.is_action_pressed("foward"):
		velocity = velocity + Vector2(0,-speed).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees -= rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rotation_speed
	
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)

