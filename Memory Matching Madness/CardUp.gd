extends CardState
@export var valueContainer : ColorRect

var cardObj :Card

func setCardValues():
	cardObj = Card.new(true,Color(Color.WHITE))
	
func Enter():
	setCardValues()
	valueContainer.set_color(cardObj.cardValue)





func _on_card_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Transitioned.emit(self,"carddown")
			print(cardObj.isFlipped)
