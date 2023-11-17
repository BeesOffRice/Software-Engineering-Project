extends CardState
class_name CardUp
@export var card :Area2D
@export var cardDisplay:TextureRect
signal Matched

func setCardValues():
	cardDisplay.texture = card.cardValue;
	card.setFlipped(true);
	card.setClickable(false);
	
func Enter():
	setCardValues()
	
