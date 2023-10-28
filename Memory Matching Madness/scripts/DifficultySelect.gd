extends Control

signal SwitchScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeToGameScene(difficulty):
	SwitchScene.emit(difficulty)

func _on_easy_pressed():
	changeToGameScene("GameLevel")


func _on_normal_pressed():
	changeToGameScene("GameLevel")


func _on_hard_pressed():
	changeToGameScene("GameLevel")
