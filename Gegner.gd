extends StaticBody2D

onready var healthbar = utils.get_main_node().get_node("HealthBarTest")
var life = 10


signal change_frame


func _ready():
	set_position(Vector2(540,440))
	healthbar.connect("zerolife", self, "on_Health_zerolife")
	pass 

func _enemy_died():
	emit_signal("change_frame")
	print("löschen")
	pass





func _on_Health_zerolife():
	print("0hp")
	_enemy_died()
	pass 
