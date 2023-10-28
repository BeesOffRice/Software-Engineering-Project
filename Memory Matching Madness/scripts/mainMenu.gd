extends Control

signal SwitchScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_new_game_pressed():
	SwitchScene.emit("DifficultySelect")
