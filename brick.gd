class_name Brick
extends Area2D

@onready var main = get_node("/root/Main")
static var orange_brick_never_hitted: bool = true
static var red_brick_never_hitted: bool = true

static func reset() -> void:
	orange_brick_never_hitted = true
	red_brick_never_hitted = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _update_score(ball: Ball) -> void:
	if $ColorRect.color == Color.YELLOW:
		main.update_score(1)
	elif $ColorRect.color == Color.WEB_GREEN:
		main.update_score(3)
	elif $ColorRect.color == Color.ORANGE:
		if orange_brick_never_hitted:
			orange_brick_never_hitted = false
			ball.accelerate()
		main.update_score(5)
	elif $ColorRect.color == Color.RED:
		if red_brick_never_hitted:
			red_brick_never_hitted = false
			ball.accelerate()
		main.update_score(7)


func _on_area_entered(area: Area2D) -> void:
	var ball = area as Ball
	ball.reflect_on_y()
	_update_score(ball)
	queue_free()
