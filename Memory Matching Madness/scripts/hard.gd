extends Difficulty


# Called when the node enters the scene tree for the first time.
func _ready():
	cardValues = Textures.hardText
	maxHP=100
	currentHP=maxHP
	
	MaxCardsFlipped.connect(_on_max_cards_flipped)
	spawnCards(80 ,112 , 6, 4, 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkWin()
