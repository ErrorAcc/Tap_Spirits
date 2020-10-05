extends Node

var bestscore = 0 setget set_bestscore
var coinscore = 0 setget set_coinscore
var lvlscore = 0 setget set_lvlscore

const filepath_bs = "user://bestscore.data"
const filepath_cs = "user://coinscore.data"
const filepath_ls = "user://lvlscore.data"

func _ready():
	load_bestscore()
	load_coinscore()
	load_lvlscore()
	pass

func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath_bs): return
	file.open(filepath_bs, File.READ)
	bestscore = file.get_var()
	file.close()
	pass

func save_bestscore():
	var file = File.new()
	file.open(filepath_bs, File.WRITE)
	file.store_var(bestscore)
	file.close()
	pass

func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
	pass


func load_coinscore():
	var file = File.new()
	if not file.file_exists(filepath_cs): return
	file.open(filepath_cs, File.READ)
	coinscore = file.get_var()
	file.close()
	pass

func save_coinscore():
	var file = File.new()
	file.open(filepath_cs, File.WRITE)
	file.store_var(coinscore)
	file.close()
	pass

func set_coinscore(new_value):
	coinscore = new_value
	save_coinscore()
	pass


func load_lvlscore():
	var file = File.new()
	if not file.file_exists(filepath_ls): return
	file.open(filepath_ls, File.READ)
	lvlscore = file.get_var()
	file.close()
	pass

func save_lvlscore():
	var file = File.new()
	file.open(filepath_ls, File.WRITE)
	file.store_var(lvlscore)
	file.close()
	pass

func set_lvlscore(new_value):
	lvlscore = new_value
	save_lvlscore()
	pass
