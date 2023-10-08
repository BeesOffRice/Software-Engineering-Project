extends CardState
class_name CardUp
@export var card :Area2D
@export var cardDisplay:ColorRect
#variable that toggles whether or not the timer can be started
var toggle = true
signal Matched

func setCardValues():
	cardDisplay.set_color(card.cardValue);
	card.setFlipped(true);
	
func Enter():
	setCardValues()
	
func Update(_delta):
	if card.isMatched and toggle:
		Matched.emit()
		toggle = false

func Input():
	print("trying to do nothing")

func Timeout():
	toggle=true
	Transitioned.emit(self,"carddown")
