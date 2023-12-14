extends Node2D
class_name Card_UI

var lowlevel : Card_lowlevel
@onready var base := $Base
@onready var image := $Base/Image
@onready var nameLabel := $Base/NameLabel
@onready var descriptLabel := $Base/DescriptLabel

func createUI():
	image.texture = load("res://images/card/1.png")
	
