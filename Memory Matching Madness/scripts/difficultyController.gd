extends Node

var levels :Dictionary = {}
signal SwitchScene
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child != $Background:
			levels[child.name.to_lower()] = child
			self.remove_child(child)
	setLevel("easy")
	levels["easy"].NotMatched.connect(_on_not_matched)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setLevel(lvlName):
	var difficulty = levels[lvlName]
	self.add_child(difficulty)
	self.add_child(levels["healthbar"])
	difficulty.GameOver.connect(_on_game_over)

func _on_not_matched(value):
	$HealthBar.value = $HealthBar.value - value

func _on_game_over():
	SwitchScene.emit("GameOver")
