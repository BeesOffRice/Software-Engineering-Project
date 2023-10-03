extends CardState

class_name CardDown

@export var valueContainer: ColorRect

var cardObj: Card

func setCardValues():
	cardObj = Card.new(false,Color(Color.BLACK))
	
	
func Enter():
	setCardValues()
	if valueContainer:
		valueContainer.set_color(cardObj.cardValue)
		CardUpdated.emit(cardObj)
	

func Input():
	Transitioned.emit(self,"cardup")
	