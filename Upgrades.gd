extends Node2D

export var crit_chance = 0
export var crit_damge = 1

export var coins = 0
export var dmg_cost = 5
export var crit_chance_cost = 1
export var crit_dmg_cost = 2

onready var interface = utils.get_main_node().get_node("Interface")
onready var health = utils.get_main_node().get_node("HealthBarTest").get_node("Health")

signal critchance
signal critdamage
signal dmgUg

func _ready():
	pass 


func _on_DamageButton_pressed():
	if Gamee.coinscore >= dmg_cost:
		Gamee.coinscore -= dmg_cost
		emit_signal("dmgUg")
		interface.get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass


func _on_Crit_Chance_pressed():
	if Gamee.coinscore >= crit_chance_cost:
		Gamee.coinscore -= crit_chance_cost
		crit_chance = crit_chance + 1
		emit_signal("critchance")
		interface.get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass 


func _on_Crit_Damage_pressed():
	if Gamee.coinscore >= crit_dmg_cost:
		Gamee.coinscore -= crit_dmg_cost
		crit_damge = crit_damge + 0.1
		emit_signal("critdamage")
		interface.get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass 


func _on_reset_pressed():
	health.schaden = 1
	crit_damge = 0
	crit_chance = 0
	Gamee.coinscore = 0
	Gamee.lvlscore = 0
	interface.get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	interface.get_node("Lvl_Counter").set_text(str(Gamee.lvlscore))
	interface.get_node("crit_dmg").set_text(str(crit_damge))
	interface.get_node("dmg_click").set_text(str(health.schaden))
	interface.get_node("crit_chance").set_text(str(crit_chance))
	pass


func _on_Gold_pressed():
	Gamee.coinscore += 100
	utils.get_main_node().get_node("Interface").get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	pass 
