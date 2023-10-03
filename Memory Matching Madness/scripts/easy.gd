extends Node
var card = preload("res://Scenes/card.tscn")
var cards =[]
var flipCount=0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnCards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check2Flip()

#spawns 6 cards and centers them
func spawnCards():
	for x in range(3):
		for y in range(2):
			if card:
				var c = card.instantiate()
				var pos = Vector2(x*(200+10)+200,38+y*(280+10))
				c.CardClicked.connect(_on_card_click)
				add_child(c)
				c.setPos(pos)
				


#checks if 2 cards are flipped, new problem is that since its in the process function the counter always keeps going
func check2Flip():
	if flipCount >=2:
		print("2 cards have been flipped")

func _on_card_click(count):
	flipCount+=count
