extends Node
var card = preload("res://Scenes/card.tscn")
var cards =[]
var flipCount=0
var score=0
var cardValues = [Color.RED,Color.YELLOW,Color.BLUE]

signal NotMatched
signal MaxCardsFlipped

# Called when the node enters the scene tree for the first time.
func _ready():
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
		if cards[0]==card:
			return
		else:
			flipCount+=count
			cards.append(card)
			if flipCount >=2:
				#tells the scene that the max amount of cards has been flipped
				MaxCardsFlipped.emit()
	
func _on_max_cards_flipped():
	print(checkMatch())
	if checkMatch():
		score+=1
		#destroys cards and resets the flipped counter
		cards[0].queue_free()
		cards[1].queue_free()
		cards.clear()
		flipCount=0
	else:
		flipCount=0
		for c in cards:
			c.isMatched=true
		cards.clear()
	
#checks if the cards chosen match
func checkMatch():
	print(cards[0].getisMatched())
	print(cards[1].getisMatched())
	return cards[0].cardValue == cards[1].cardValue
