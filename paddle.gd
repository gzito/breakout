extends Area2D

@onready var lborder = get_node("/root/Main/LeftBorder")
@onready var rborder = get_node("/root/Main/RightBorder")
@onready var _initial_width : float = $ColorRect.size.x
@onready var _half_width : float = $ColorRect.size.x / 2.0

var hits: int = 0
var halved: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var displacement = DisplayServer.mouse_get_position().x
	var winpos = get_window().position.x
	var relativeX = displacement - winpos
	if relativeX > 0:
		position.x = relativeX
		if position.x < lborder.position.x+lborder.get_node("ColorRect").size.x:
			position.x = lborder.position.x+8
		if position.x + $ColorRect.size.x > rborder.position.x:
			position.x = rborder.position.x - $ColorRect.size.x

func get_center_x():
	return position.x + _half_width
	
func _on_area_entered(area: Area2D) -> void:
	var ball = area as Ball
	ball.reflect_on_y()
	
	var bvelocity = ball.direction * ball.speed
	bvelocity.x = remap(ball.get_center_x()-get_center_x(),-_half_width,_half_width,-450,450)
	
	ball.direction = (bvelocity / ball.speed).normalized()
	ball.speed = bvelocity.length()
	if ball.speed > Ball.MAX_SPEED:
		ball.speed = Ball.MAX_SPEED
	
	# score
	hits += 1
	if hits == 4:
		ball.accelerate()
	elif hits == 12:
		ball.accelerate()

func reset_hits():
	hits = 0
	$ColorRect.size.x = _initial_width
	_half_width = _initial_width / 2.0
	$CollisionShape2D.position.x = _half_width
	halved = false

func halve_width():
	if not halved:
		$ColorRect.size.x /= 2
		_half_width /= 2
		$CollisionShape2D.position.x = _half_width
		halved = true
	
