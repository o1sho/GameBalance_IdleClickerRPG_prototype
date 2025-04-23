class_name Game
extends Control

@export var portrait_name: String = PlayerPortraitData.current_portrait

var session_schedule = []
var current_session_index = 0
var session_timer = 0.0
var is_session_active = false

var current_enemy_hp

func _ready():
	session_schedule = PlayerPortraitData.get_schedule(portrait_name)
	start_next_session()
	update_ui()

func start_next_session():
	if current_session_index >= session_schedule.size():
		print("Все сессии завершены")
		return
	var minutes = session_schedule[current_session_index]
	session_timer = minutes * 60  # перевод в секунды
	is_session_active = true
	current_session_index += 1
	print("Началась новая сессия на %s минут" % minutes)
	
	set_enemy_max_hp(Data.level, Data.enemy_index)
	set_gold_for_killing_enemy(Data.enemy_max_hp, Data.enemy_index)

func _process(delta):
	if is_session_active:
		session_timer -= delta
		$SessionTimerLabel.text = "Session Time Left: %.0f sec." % session_timer
		if session_timer <= 0:
			is_session_active = false
			print("Сессия завершена")


func kill_enemy():
	Data.gold += Data.gold_for_kill
	Data.enemy_index += 1
	set_enemy_max_hp(Data.level, Data.enemy_index)

func update_ui():
	$GoldLabel.text = "Gold: %d" % Data.gold
	#$TapDamageLabel.text = "Tap: %d" % Data.tap_damage
	$HPBar.max_value = Data.enemy_max_hp
	$HPBar.value = current_enemy_hp
	$GoldForKillingEnemyLabel.text = "Gold for killing enemy: %d" % Data.gold_for_kill
	$CurrentEnemyHPLabel.text = "Current enemy HP: %d" % current_enemy_hp
	$EnemyIndexLabel.text = "Enemy index: %d" % Data.enemy_index
	$LevelLabel.text = "Level: %d" % Data.level

func _on_upgrade_tap_button_pressed() -> void:
	var cost = Data.tap_damage * 5
	if Data.gold >= cost:
		Data.gold -= cost
		Data.tap_damage += 1
	update_ui()


func _on_enemy_pressed() -> void:
	if not is_session_active:
		return
	current_enemy_hp -= Data.tap_damage
	$HPBar.value = current_enemy_hp
	if current_enemy_hp <= 0:
		kill_enemy()
	update_ui()

func set_gold_for_killing_enemy(enemy_max_hp: int, enemy_index: int):
	if enemy_index == 10:
		Data.gold_for_kill = round(enemy_max_hp * 0.2)
	else:
		Data.gold_for_kill = round(enemy_max_hp * 0.1)
		
func set_enemy_max_hp(level: int, enemy_index: int) -> void:
	if enemy_index == 10:
		Data.enemy_max_hp = round(10 * pow(3.2, level) * pow(1.07, enemy_index - 1) * 1.5)
		current_enemy_hp = Data.enemy_max_hp
		$HPBar.max_value = Data.enemy_max_hp
		$HPBar.value = current_enemy_hp
	else: 
		Data.enemy_max_hp = round(10 * pow(3.2, level) * pow(1.07, enemy_index - 1))
		current_enemy_hp = Data.enemy_max_hp
		$HPBar.max_value = Data.enemy_max_hp
		$HPBar.value = current_enemy_hp
