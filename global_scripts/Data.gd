extends Node

var level: int = 1

var _enemy_index: int = 1
var enemy_index: int:
	get:
		return _enemy_index
	set(value):
		if value > 10:
			_enemy_index = 1
			level += 1
		else:
			_enemy_index = clamp(value, 1, 10)

var enemy_max_hp: int = 0

var gold: int = 0
var gold_for_kill: int = 0

var tap_damage = 5
var tap_level = 1
var cost_tap_upgrade = 0
