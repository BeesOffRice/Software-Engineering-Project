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
	


func _on_card_input_event(viewport, event, shape_idx):
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print(cardObj.isFlipped)
				Transitioned.emit(self,"cardup")
				
