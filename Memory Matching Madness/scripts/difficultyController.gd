extends Node

var levels :Dictionary = {}
var currentLevel : String
var gameResults : String
signal SwitchScene
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child != $Background and child != $GameUIButtons:
			levels[child.name.to_lower()] = child
			self.remove_child(child)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setLevel(lvlName):
	lvlName = lvlName.to_lower()
	currentLevel = lvlName
	var difficulty = levels[lvlName]
	self.add_child(difficulty)
	difficulty.NotMatched.connect(_on_not_matched)
	
	#if the difficulty isn't easy, add a healthbar and set its values
	if(lvlName!="easy"):
		self.add_child(levels["healthbar"])
		$HealthBar.max_value = difficulty.maxHP
		$HealthBar.value = difficulty.currentHP
		
	if(lvlName=="hard"):
		var timer = levels["hardtimer"]
		self.add_child(timer)
		timer.start()
		
	difficulty.GameOver.connect(_on_game_over)

func _on_not_matched(lvl,value):
	#if health bar exists, update the health bar
	if($HealthBar):
		lvl.currentHP -= value
		$HealthBar.value = lvl.currentHP
		if(lvl.currentHP <= 0):
			await get_tree().create_timer(0.7).timeout
			lvl.GameOver.emit("You lose")

func _on_game_over(state):
	gameResults = state
	SwitchScene.emit("GameOver")


func _on_hard_timer_timeout():
	levels[currentLevel].GameOver.emit("You lose")


func _on_settings_btn_pressed():
	SwitchScene.emit("Settings")


func _on_home_btn_pressed():
	SwitchScene.emit("MainMenu")
