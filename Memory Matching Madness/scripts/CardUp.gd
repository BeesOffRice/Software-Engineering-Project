extends CardState
class_name CardUp
@export var card :Area2D
@export var cardDisplay:ColorRect
signal Matched

func setCardValues():
	cardDisplay.set_color(card.cardValue);
	card.setFlipped(true);
	card.setClickable(false);
	
func Enter():
	setCardValues()
	
