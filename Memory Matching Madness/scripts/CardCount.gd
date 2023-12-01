extends HBoxContainer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Settings.cardSetting):
		show()
	else:
		hide()
