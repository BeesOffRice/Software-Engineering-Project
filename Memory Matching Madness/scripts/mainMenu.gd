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


func _on_settings_pressed():
	get_tree().paused=true
	$SettingsPage.show()


func _on_settings_page_settings_btn_press():
	get_tree().paused=false


func _on_how_to_play_pressed():
	SwitchScene.emit("HowToPlay")
