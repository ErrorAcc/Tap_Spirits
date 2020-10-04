extends Node

export(int) var max_amount = 10 setget set_max

var schaden = 1
var ememy_count = 0

onready var current = max_amount setget set_current

onready var upgrades = utils.get_main_node().get_node("Upgrades")

signal max_changed(new_max)
signal changed(new_amount)
signal depleted
signal zerolife


func _ready():
	upgrades.connect("dmgUg", self, "dmgUg")
	initialize()
	if current == 1:
		print("dead")
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
		print("dead")
		ememy_count += 1
		print(ememy_count)
		if ememy_count == 5:
			ememy_count = 0
			max_amount = max_amount * 1.4
			print(max_amount)
		current = max_amount + schaden
	pass




func _on_dmg_Button_pressed():
	current -= schaden
	initialize()
	pass


####Upgrades#####

func dmgUg():
	schaden += 1
	print("more dmg")
	pass
