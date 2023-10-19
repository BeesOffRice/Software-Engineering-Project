extends Difficulty
# Called when the node enters the scene tree for the first time.

func _ready():
	cardValues = [Color.RED,Color.YELLOW,Color.BLUE]
	MaxCardsFlipped.connect(_on_max_cards_flipped)
	print("easy")
	spawnCards(200,280, 3 ,2, 5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkWin()

	
#spawns 6 cards and centers them



