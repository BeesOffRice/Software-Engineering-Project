extends Area2D
@export var cardVal: Color
var currentCard: Card = Card.new(false,cardVal)
var canFlip: bool
signal CardClicked

# Called when the node enters the scene tree for the first time.
func _ready():
	$StateMachine/CardDown.CardUpdated.connect(_on_card_update)
	$StateMachine/CardUp.CardUpdated.connect(_on_card_update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#flips a card so it is facedown
func flipDown():
	$StateMachine.changeDown()


func setPos(pos,col):
	cardVal=col
	position=pos
	
func _on_card_update(cardObj,cardState):
	currentCard= cardObj
	if cardState == get_node("StateMachine/CardUp"):
		currentCard.name="face up card"
		CardClicked.emit(1,self)


func _on_card_up_matched():
	$FlipTimer.start()
