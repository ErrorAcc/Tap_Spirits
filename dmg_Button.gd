extends Button



signal did_dmg

func _ready():
	pass 


func _on_Button_dmg_pressed():
	print("kkkkkkk")
	emit_signal("did_dmg")
	pass 
