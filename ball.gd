class_name Ball 
extends Area2D

var speed: float = 200
var accel: float = 50
var direction: Vector2 = Vector2(randf_range(-1,1),1).normalized()

@onready var _initial_position: Vector2 = position
@onready var _initial_speed: float = speed
@onready var half_width : float = $ColorRect.size.x / 2.0

const MAX_SPEED: float = 450

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * direction * delta

func get_center_x():
	return position.x + half_width

func reflect_on_x() -> void:
	direction.x = -direction.x

func reflect_on_y() -> void:
	direction.y = -direction.y

func accelerate() -> void:
	speed += accel
	if speed > MAX_SPEED:
		speed = MAX_SPEED

func reset() -> void:
	position = _initial_position
	speed = _initial_speed
	direction = Vector2(randf_range(-1,1),1).normalized()
