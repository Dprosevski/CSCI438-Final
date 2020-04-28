extends Spatial


var bgMusic = AudioStreamPlayer.new()



func _ready():
	self.add_child(bgMusic)
	bgMusic.stream = load("res://Imports/bgMusic.mp3")
	bgMusic.play()
	pass
