extends Node2D

signal dmgUg

func _ready():
	pass 


func _on_DamageButton_pressed():
	print("dmgUg")
	emit_signal("dmgUg")
	pass
