extends Control
signal AlertBtnPress

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_no_pressed():
	AlertBtnPress.emit("no")
	hide()


func _on_yes_pressed():
	AlertBtnPress.emit("yes")
