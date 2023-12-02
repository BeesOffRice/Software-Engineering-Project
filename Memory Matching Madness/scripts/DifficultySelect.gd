extends Control

signal SwitchScene
@export var display : TextureRect
@export var description : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeToGameScene(difficulty):
	SwitchScene.emit(difficulty)

func _on_easy_pressed():
	changeToGameScene("Easy")


func _on_normal_pressed():
	changeToGameScene("Normal")


func _on_hard_pressed():
	changeToGameScene("Hard")


func _on_easy_mouse_entered():
	display.texture = Textures.difficultyDisplay[0]
	description.text = "For beginners, it's the bunny hill!
*Unlimited Time
*Unlimited Life
*Limited Card Set - 6 Cards"


func _on_normal_mouse_entered():
	display.texture = Textures.difficultyDisplay[1]
	description.text = "The standard difficulty, for those that want a more difficult challenge.
	*Unlimited Time
	*Limited Life - 50 Health
	*Limited Card Set - 10 Cards"


func _on_hard_mouse_entered():
	display.texture = Textures.difficultyDisplay[2]
	description.text = "The most difficult challenge, not for the faint of heart!
	*Limited Time - 5 Minutes
	*Limited Life - 100 Health
	*Limited Card Set - 20 Cards"
	
