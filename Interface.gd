extends Node


var coins = 0

onready var health = utils.get_main_node().get_node("HealthBarTest").get_node("Health")
onready var gegner = utils.get_main_node().get_node("HealthBarTest").get_node("Health").get_node("Gegner")
onready var upgrades = utils.get_main_node().get_node("Upgrades")

func _ready():
	upgrades.connect("dmgUg", self, "_dmg_per_click")
	gegner.connect("change_frame",self,"get_coins")
	get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	get_node("Lvl_Counter").set_text(str(Gamee.lvlscore))
	pass 

func get_coins():

	Gamee.lvlscore += 1
	Gamee.coinscore += 1
	get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	
	get_node("Lvl_Counter").set_text(str(Gamee.lvlscore))
	pass

func _dmg_per_click():
	print(health.schaden)
	get_node("dmg_click").set_text(str(health.schaden))
	pass
