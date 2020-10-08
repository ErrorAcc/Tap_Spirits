extends Node

var random = 0
var crit_hit = false

export(int) var max_amount = 10 setget set_max
export var schaden = 1
export var ememy_count = 0
export var lvl_count = 0

onready var current = max_amount setget set_current
onready var upgrades = utils.get_main_node().get_node("Upgrades")
onready var spirit_water = utils.get_main_node().get_node("Spirit_Water")

signal max_changed(new_max)
signal changed(new_amount)
signal depleted
signal zerolife


func _ready():
	upgrades.connect("dmgUg", self, "dmgUg")
	spirit_water.connect("dmg_w", self, "dmg_w")
	initialize()
	pass

func set_max(new_max):
	max_amount = max(1, new_max)
	emit_signal("max_changed", max_amount)


func set_current(new_value):
	current = new_value
	current = clamp(current, 0, max_amount)
	emit_signal("changed",current)
	if current == 0:
		emit_signal("depleted")


func initialize():
	emit_signal("max_changed", max_amount)
	emit_signal("changed", current)
	if current <= 1:
		emit_signal("zerolife")
		ememy_count += 1
		lvl_count += 1
		if ememy_count == 5:
			ememy_count = 0
			max_amount = max_amount * 1.4
			print(max_amount)
		current = max_amount + schaden
	pass




func _on_dmg_Button_pressed():
	randomize_crit()
	current -= schaden
	if crit_hit == true:
		schaden = schaden / upgrades.crit_damge
		crit_hit = false
	initialize()
	pass

func randomize_crit():
	random = randi()%100 + 1
	if random <= upgrades.crit_chance:
		schaden = schaden * upgrades.crit_damge
		crit_hit = true
	pass


####Upgrades#####

func dmgUg():
	schaden += 1
	print("more dmg")
	pass



#####Spirits####

###Water##
func dmg_w():
	current -= spirit_water.dmg_water
	initialize()
	pass
#########
