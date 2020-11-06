extends Node




onready var health = utils.get_main_node().get_node("HealthBarTest").get_node("Health")
onready var gegner = utils.get_main_node().get_node("HealthBarTest").get_node("Health").get_node("Gegner")
onready var upgrades = utils.get_main_node().get_node("Upgrades")

func _ready():
	upgrades.connect("dmgUg", self, "_dmg_per_click")
	upgrades.connect("critdamage", self, "_crit_dmg")
	upgrades.connect("critchance", self, "_crit_chance")
	gegner.connect("change_frame",self,"get_coins")
	
	get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	get_node("Lvl_Counter").set_text(str(Gamee.lvlscore))
	get_node("dmg_click").set_text(str(health.schaden))
	get_node("crit_dmg").set_text(str(upgrades.crit_damge))
	get_node("crit_chance").set_text(str(upgrades.crit_chance))
	get_node("dmg_click_cost").set_text(str(upgrades.dmg_cost))
	get_node("crit_chance_cost").set_text(str(upgrades.crit_chance_cost))
	get_node("crit_dmg_cost").set_text(str(upgrades.crit_dmg_cost))
	pass 

func get_coins():
	Gamee.lvlscore += 1
	Gamee.coinscore += 1
	get_node("Coin_Counter").set_text(str(Gamee.coinscore))
	get_node("Lvl_Counter").set_text(str(Gamee.lvlscore))
	pass

func _dmg_per_click():
	get_node("dmg_click").set_text(str(health.schaden))
	pass

func _crit_dmg():
	get_node("crit_dmg").set_text(str(upgrades.crit_damge))
	pass

func _crit_chance():
	get_node("crit_chance").set_text(str(upgrades.crit_chance))
	pass
