extends Node

class_name Card

var isFlipped: bool 
var cardValue: Color  
var isMatched: bool

func _init(flip,value):
	self.isFlipped=flip
	self.cardValue=value
		
		
func checkFlip():
	return isFlipped
