extends Area2D

var stateHandler


# Called when the node enters the scene tree for the first time.
func _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			stateHandler.flipCard()
			