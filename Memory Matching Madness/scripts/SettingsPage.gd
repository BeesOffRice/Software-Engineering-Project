extends Control
signal SettingsBtnPress
@export var healthOpt : CheckButton
@export var cardOpt : CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	healthOpt.button_pressed = Settings.healthSetting
	cardOpt.button_pressed = Settings.cardSetting
	hide()
	#show()
	
func _process(_delta):
	pass

func _on_close_settings_btn_pressed():
	Settings.healthSetting=healthOpt.button_pressed
	Settings.cardSetting=cardOpt.button_pressed
	hide()
	SettingsBtnPress.emit()
