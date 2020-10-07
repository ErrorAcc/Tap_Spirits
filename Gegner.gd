extends StaticBody2D

export var enemy_counter = 0
onready var healthbar = utils.get_main_node().get_node("HealthBarTest")
var life = 10


signal change_frame


func _ready():
	set_position(Vector2(540,440))
	pass 

func _enemy_died():
	enemy_counter += 1
	emit_signal("change_frame")
	pass





func _on_Health_zerolife():
	_enemy_died()
	pass 
