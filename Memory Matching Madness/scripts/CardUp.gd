extends CardState
@export var valueContainer : ColorRect

var cardObj :Card

func setCardValues():
	cardObj = Card.new(true,Color(Color.WHITE))
	
func Enter():
	setCardValues()
	valueContainer.set_color(cardObj.cardValue)
	CardUpdated.emit(cardObj)

func Input():
	Transitioned.emit(self,"carddown")
	
