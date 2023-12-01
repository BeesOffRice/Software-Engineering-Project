#This class handles the game mechanics
extends Node

class_name Difficulty
var maxHP
var currentHP
var card = preload("res://Scenes/card.tscn")
#cards that are currently active
var cards = []
#every card currently visible in the scene
var allCards = []
var flipCount=0
var score=0

var cardValues = []

signal GameOver
signal NotMatched
signal ScoreUpdated
signal MaxCardsFlipped

#spawns all of the cards in
func spawnCards(width,height, rows, columns, size):
	var valIndex = 0
	for x in range(rows):
		for y in range(columns):
			if card:
				var c = card.instantiate()
				var pos = Vector2(x*(width+20)+576-(width*rows/2)-(20*rows/2),y*(height+20)+324-(height*columns/2)-(20*columns/2))
				c.CardClicked.connect(_on_card_click)
				add_child(c)
				allCards.append(c)
				c.init(pos,cardValues[valIndex],size)
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


#what happens when 2 cards are flipped
func _on_max_cards_flipped():
	setAllCanFlip(false)
	if checkMatch():
		score+=1
		ScoreUpdated.emit(score)
		#destroys cards and resets the flipped counter
		await get_tree().create_timer(0.5).timeout
		for c in cards:
			c.queue_free()
			allCards.erase(c)
		cards.clear()
		flipCount=0
		setAllCanFlip(true)
	else:
		await get_tree().create_timer(0.5).timeout
		for c in cards:
			c.flipDown()
		NotMatched.emit(self,10)
		cards.clear()
		flipCount=0
		setAllCanFlip(true)

#toggles whether the cards are flippable or not
func setAllCanFlip(val:bool):
	for c in allCards:
		c.canFlip = val

#checks if the cards chosen match
func checkMatch():
	return cards[0].cardValue == cards[1].cardValue

#checks if there are no cards left
func checkWin():
	if get_child_count()==0:
		GameOver.emit("You win")
