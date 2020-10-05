extends Node


var coins = 0

onready var health = utils.get_main_node().get_node("HealthBarTest").get_node("Health")
onready var gegner = utils.get_main_node().get_node("HealthBarTest").get_node("Health").get_node("Gegner")

func _ready():
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
