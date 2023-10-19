extends Area2D
signal CardClicked

var isFlipped: bool = false
@export var cardValue: Color  
var cardBack: Color = Color(Color.BLACK);
var isMatched: bool = false;
var canFlip: bool = true;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func flipDown():
	$StateMachine.changeState("carddown")

func setFlipped(val):
	isFlipped=val
	
func setClickable(val):
	canFlip = val

func getisMatched():
	return isMatched

func setPos(pos,col):
	position=pos
	cardValue=col

#sends the card and the number 1 to be handled by the game scene
func _on_card_down_card_clicked(num):
	if canFlip:
		CardClicked.emit(num,self)
