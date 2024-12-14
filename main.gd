extends Node2D

#1152 x 648
#
#32*14 + 4*13 + 16 = 516
#
#(1152/2) - (516/2) = 576 - 258 = 318

var brick = preload("res://brick.tscn")
var score:int = 0
var ball_num: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var y: int = 160
	var colors = [Color.RED,Color.ORANGE,Color.WEB_GREEN,Color.YELLOW]
	for c in 4:
		for r in 2:
			for n in 14:
				var brick_instance = brick.instantiate()
				add_child(brick_instance)
				brick_instance.position = Vector2(326+((32+4)*n),y)
				brick_instance.get_node("ColorRect").color = colors[c]
			y += 12

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score_incr:int):
	self.score += score_incr
	$ScoreP1.text = "%03d" % self.score

func update_ballnum():
	$BallNum.text = str(ball_num)
