extends Node

class_name CardState

signal Transitioned
signal CardUpdated

#entering the state
func Enter():
	pass

#leaving the state
func Exit():
	pass

func Update(_delta:float):
	pass
	
func Input():
	pass
