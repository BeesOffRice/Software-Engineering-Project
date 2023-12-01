extends Node

@onready var currentScene = preload("res://Scenes/mainMenu.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(currentScene)
	currentScene.SwitchScene.connect(_on_scene_switch)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_scene_switch(scene):
	var newScene
	match scene:
		"DifficultySelect":
			newScene = load("res://Scenes/DifficultySelect.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
		"GameOver":
			newScene = load("res://Scenes/game_over.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			newScene.setGameResultLabel(currentScene.gameResults)
			currentScene.queue_free()
			currentScene = newScene
		"MainMenu":
			newScene = load("res://Scenes/mainMenu.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
		"Easy":
			newScene = load("res://Scenes/difficulty.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
			currentScene.setLevel("easy")
		"Normal":
			newScene = load("res://Scenes/difficulty.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
			currentScene.setLevel("normal")
		"Hard":
			newScene = load("res://Scenes/difficulty.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
			currentScene.setLevel("hard")
		"HowToPlay":
			newScene = load("res://Scenes/HowToPlay.tscn").instantiate()
			add_child(newScene)
			newScene.SwitchScene.connect(_on_scene_switch)
			currentScene.queue_free()
			currentScene = newScene
