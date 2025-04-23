extends Node

var current_portrait = "portrait_1"

var portraits = {
	"portrait_1": [15, 15, 15], 
	"portrait_2": [30, 20, 20, 30, 30],
	"portrait_3": [15, 15, 15],
	"portrait_4": [15, 15, 15], 
	"portrait_5": [30, 20, 20, 30, 30],
	"portrait_6": [15, 15, 15],
}

func get_schedule(portrait_name: String) -> Array:
	return portraits.get(portrait_name, [])
