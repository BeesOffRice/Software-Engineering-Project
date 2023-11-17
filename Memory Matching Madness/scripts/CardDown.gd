extends CardState

class_name CardDown

@export var card: Area2D
@export var colorDisplay:TextureRect

func setCardValues():
	colorDisplay.texture = card.cardBack;
	card.setFlipped(false);
	
	
func Enter():
	setCardValues()


func Input():
	CardClicked.emit(1)
	Transitioned.emit(self,"cardup")
	
