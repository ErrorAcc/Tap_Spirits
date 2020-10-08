extends Node2D

export var crit_chance = 0
export var crit_damge = 1

signal critchance
signal critdamage
signal dmgUg

func _ready():
	pass 


func _on_DamageButton_pressed():
	emit_signal("dmgUg")
	pass


func _on_Crit_Chance_pressed():
	crit_chance = crit_chance + 1
	emit_signal("critchance")
	pass 


func _on_Crit_Damage_pressed():
	crit_damge = crit_damge + 0.1
	emit_signal("critdamage")
	pass 
