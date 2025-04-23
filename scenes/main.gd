extends Control

var game_scene = load("res://scenes/game.tscn")

func _on_button_1_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_1"
	get_tree().change_scene_to_packed(game_scene)


func _on_button_2_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_2"
	get_tree().change_scene_to_packed(game_scene)


func _on_button_3_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_3"
	get_tree().change_scene_to_packed(game_scene)


func _on_button_4_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_4"
	get_tree().change_scene_to_packed(game_scene)


func _on_button_5_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_5"
	get_tree().change_scene_to_packed(game_scene)


func _on_button_6_pressed() -> void:
	PlayerPortraitData.current_portrait = "portrait_6"
	get_tree().change_scene_to_packed(game_scene)
