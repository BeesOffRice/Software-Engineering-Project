extends Area2D
var currentCard: Card = Card.new(false,Color.BLACK)
signal CardClicked

# Called when the node enters the scene tree for the first time.
func _ready():
	$StateMachine/CardDown.CardUpdated.connect(_on_card_update)
	$StateMachine/CardUp.CardUpdated.connect(_on_card_update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setPos(pos):
	position=pos
	
func _on_card_update(cardObj):
	currentCard = cardObj
	currentCard.name="some name"
	CardClicked.emit(1)
	
