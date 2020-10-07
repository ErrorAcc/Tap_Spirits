extends Node2D

export var dmg_water = 5

signal dmg_w

func _ready():
	pass



func _on_Timer_Water_timeout():
	emit_signal("dmg_w")
	pass
