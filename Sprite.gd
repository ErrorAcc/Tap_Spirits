extends Sprite

var framevar = 0
func _ready():
	pass

func _on_Gegner_change_frame():
	framevar = framevar + 1
	set_frame(framevar)
	pass 
