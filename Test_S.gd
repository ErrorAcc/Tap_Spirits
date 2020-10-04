extends Node

#onready var test = utils.get_main_node().get_node("Timer")
func _ready():
	#test.connect("timeout", self, "_on_timer_timeout")
	pass 

func _on_timer_timeout():
	#print("HIIIIIIIIIII")
	pass
