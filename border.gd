extends Area2D

enum BoundaryLocation { TOP, BOTTOM, LEFT, RIGHT }
@export var location : BoundaryLocation = BoundaryLocation.TOP

@onready var main = get_node("/root/Main")
@onready var paddle = get_node("/root/Main/Paddle")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	var ball = area as Ball 
	if location == BoundaryLocation.TOP:
		ball.reflect_on_y()
		paddle.halve_width()
	elif location == BoundaryLocation.LEFT or location == BoundaryLocation.RIGHT:
		ball.reflect_on_x()
	elif location == BoundaryLocation.BOTTOM:
		ball.reset()
		paddle.reset_hits()
		Brick.reset()
		main.ball_num += 1
		main.update_ballnum()
