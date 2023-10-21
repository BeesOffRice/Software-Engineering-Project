extends Node

var levels :Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child != $Background:
			levels[child.name.to_lower()] = child
			self.remove_child(child)
	setLevel("normal")
	levels["normal"].NotMatched.connect(_on_not_matched)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setLevel(lvlName):
	self.add_child(levels[lvlName])
	self.add_child(levels["healthbar"])

func _on_not_matched(value):
	$HealthBar.value = $HealthBar.value - value
