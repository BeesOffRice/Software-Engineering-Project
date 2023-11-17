extends Difficulty

# Called when the node enters the scene tree for the first time.
func _ready():
	cardValues = Textures.normalText
	MaxCardsFlipped.connect(_on_max_cards_flipped)
	maxHP = 50
	currentHP = maxHP
	spawnCards(160 ,224 , 5, 2, 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkWin()

