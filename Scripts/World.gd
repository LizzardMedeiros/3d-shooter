extends Spatial

var score = 0
onready var score_label = $CanvasLayer/RichTextLabel

func _process(delta):
	score_label.text = str(score) + " Pts"
