extends Node
var card = preload("res://Scenes/card.tscn")
var cards = []
var allCards = []
var flipCount=0
var score=0
var cardValues = [Color.RED,Color.YELLOW,Color.BLUE]

signal NotMatched
signal MaxCardsFlipped

# Called when the node enters the scene tree for the first time.
func _ready():
	var flippedCards = $FlippedCards
	MaxCardsFlipped.connect(_on_max_cards_flipped)
	spawnCards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkWin()

#checks if every card has been matched
func checkWin():
	if get_child_count()==0:
		print("you win")
	
#spawns 6 cards and centers them
func spawnCards():
	var valIndex = 0
	for x in range(3):
		for y in range(2):
			if card:
				var c = card.instantiate()
				var pos = Vector2(x*(200+10)+200,38+y*(280+10))
				c.CardClicked.connect(_on_card_click)
				add_child(c)
				allCards.append(c)
				c.setPos(pos,cardValues[valIndex])
				if valIndex < cardValues.size()-1:
					valIndex+=1
				else:
					valIndex = 0
				

#when a card is flipped, the flip count increases and the card is added to the array of cards
func _on_card_click(count,card):
	if flipCount == 0:
		flipCount+=count
		cards.append(card)
	else:
		#if the cards are the same
		if cards[0]==card:
			return
		else:
			flipCount+=count
			cards.append(card)
			if flipCount >=2:
				#tells the scene that the max amount of cards has been flipped
				MaxCardsFlipped.emit()
	
func _on_max_cards_flipped():
	setAllCanFlip(false)
	if checkMatch():
		score+=1
		#destroys cards and resets the flipped counter
		await get_tree().create_timer(0.5).timeout
		for c in cards:
			c.queue_free()
			allCards.erase(c)
		cards.clear()
		flipCount=0
		setAllCanFlip(true)
	else:
		flipCount=0
		await get_tree().create_timer(0.5).timeout
		for c in cards:
			c.flipDown()
		cards.clear()
		setAllCanFlip(true)
	
#toggles whether the cards are flippable or not
func setAllCanFlip(val:bool):
	for c in allCards:
		c.canFlip = val
	
#checks if the cards chosen match
func checkMatch():
	return cards[0].cardValue == cards[1].cardValue

