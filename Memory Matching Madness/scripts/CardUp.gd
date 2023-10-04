extends CardState
class_name CardUp
@export var valueContainer : ColorRect
@export var selfCard :Area2D
var cardObj :Card 
#variable that toggles whether or not the timer can be started
var toggle = true
signal Matched

func setCardValues():
	cardObj = selfCard.currentCard
	cardObj = Card.new(true,selfCard.cardVal)
	
func Enter():
	setCardValues()
	valueContainer.set_color(cardObj.cardValue)
	CardUpdated.emit(cardObj,self)
	
func Update(_delta):
	if selfCard.currentCard.isMatched and toggle:
		Matched.emit()
		toggle = false

func Input():
	print("trying to do nothing")

func Timeout():
	toggle=true
	Transitioned.emit(self,"carddown")
