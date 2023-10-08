extends Node2D

@export var card: Area2D
@export var initialState:CardState 

var currentState : CardState
var states: Dictionary={}
# Called when the node enters the scene tree for the first time.
func _ready():
	#checks all children of the state machine node and adds them to the state dictionary
	for child in get_children():
		if child is CardState:
			states[child.name.to_lower()]=child
			child.Transitioned.connect(on_child_transition)
	
	#checks if initial state exists, and then enters it
	if initialState:
		initialState.Enter()
		currentState = initialState


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentState:
		currentState.Update(delta)
		
#manually change states
func changeState(stateName):
	var newState = states.get(stateName.to_lower())
	if not newState:
		return
	if currentState:
		currentState.Exit()
	newState.Enter()
	currentState=newState
	
		
func on_child_transition(state,newStateName):
	#checks if state calling this isnt the current state
	if state!=currentState:
		return
		
	#gets the state that you want to change to and checks if it exists
	var newState = states.get(newStateName.to_lower())
	if not newState:
		return
	
	#exits the state you changed from
	if currentState:
		currentState.Exit()
	
	#enters the new state and officially changes current state to new state	
	newState.Enter()	
	currentState = newState

#flips card when it is clicked
func _on_card_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and card.canFlip:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if(currentState):
				currentState.Input()

