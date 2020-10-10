extends Node2D

export var crit_chance = 0
export var crit_damge = 1

export var coins = 0
export var dmg_cost = 5
export var crit_chance_cost = 1
export var crit_dmg_cost = 2

signal critchance
signal critdamage
signal dmgUg

func _ready():
	pass 


func _on_DamageButton_pressed():
	if Gamee.coinscore >= dmg_cost:
		Gamee.coinscore -= dmg_cost
		emit_signal("dmgUg")
		utils.get_main_node().get_node("Interface").get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass


func _on_Crit_Chance_pressed():
	if Gamee.coinscore >= crit_chance_cost:
		Gamee.coinscore -= crit_chance_cost
		crit_chance = crit_chance + 1
		emit_signal("critchance")
		utils.get_main_node().get_node("Interface").get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass 


func _on_Crit_Damage_pressed():
	if Gamee.coinscore >= crit_dmg_cost:
		Gamee.coinscore -= crit_dmg_cost
		crit_damge = crit_damge + 0.1
		emit_signal("critdamage")
		utils.get_main_node().get_node("Interface").get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass 
