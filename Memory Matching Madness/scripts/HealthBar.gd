extends ProgressBar

var maxHP = 50 
var currentHP = 40
var sb: StyleBoxFlat

# Called when the node enters the scene tree for the first time.
func _ready():
	sb = StyleBoxFlat.new()
	add_theme_stylebox_override("fill",sb)
	sb.bg_color=Color.GREEN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Settings.healthSetting):
		show()
	else:
		hide()
	changeBarColor()


func changeBarColor():
	if value <= max_value*0.2:
		sb.bg_color=Color.RED
	elif value <= max_value*0.5:
		sb.bg_color=Color.YELLOW
