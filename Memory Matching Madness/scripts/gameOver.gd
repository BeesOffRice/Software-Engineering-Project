extends Control
signal SwitchScene
@export var gameResultLabel : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	SwitchScene.emit("DifficultySelect")


func _on_main_menu_pressed():
	SwitchScene.emit("MainMenu")
	
func setGameResultLabel(text):
	gameResultLabel.text = text
	
